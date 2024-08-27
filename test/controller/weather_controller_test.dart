import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/controller/weather_controller.dart';
import 'package:flutter_training/model/weather_error.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<WeatherService>()])
import 'weather_controller_test.mocks.dart';

void main() {
  final response = WeatherResponseModel(
    weatherCondition: WeatherType.cloudy,
    maxTemperature: 0,
    minTemperature: 0,
    date: DateTime(2024),
  );
  final param = WeatherParameterModel(area: 'tokyo', date: DateTime(2024));

  test('controllerのfetchが呼び出されたとき, serviceのfetchが呼び出される', () async {
    final mock = MockWeatherService();
    final container = ProviderContainer(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );
    addTearDown(container.dispose);
    when(mock.fetch(any)).thenAnswer((_) async => response);

    await container.read(weatherNotifierProvider.notifier).fetch(param);

    verify(mock.fetch(any)).called(1);
  });

  test('controllerのfetchが呼び出されたとき, Notifierの値が更新される', () async {
    final mock = MockWeatherService();
    final container = ProviderContainer(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );
    addTearDown(container.dispose);
    when(mock.fetch(any)).thenAnswer((_) async => response);

    final value1 = container.read(weatherNotifierProvider);
    expect(value1.value, null);

    await container.read(weatherNotifierProvider.notifier).fetch(param);
    final value2 = container.read(weatherNotifierProvider);
    expect(value2.value, response);
  });

  test('controllerがloading中なら, Serviceのfetchを呼び出さない', () async {
    final mock = MockWeatherService();
    final container = ProviderContainer(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );
    addTearDown(container.dispose);
    final completer = Completer<WeatherResponseModel>();
    when(mock.fetch(any)).thenAnswer((_) => completer.future);

    // 最初の実行
    unawaited(container.read(weatherNotifierProvider.notifier).fetch(param));
    final value1 = container.read(weatherNotifierProvider);
    expect(value1.isLoading, true);

    // ローディング中の実行
    unawaited(container.read(weatherNotifierProvider.notifier).fetch(param));
    final value2 = container.read(weatherNotifierProvider);
    expect(value2.isLoading, true);

    // Future を終了させる
    completer.complete(response);
    await container.read(weatherNotifierProvider.notifier).fetch(param);

    // Future が終了した後の実行
    final value3 = container.read(weatherNotifierProvider);
    expect(value3.isLoading, false);

    verify(mock.fetch(any)).called(1);
  });

  test('WeatherService.fetchで例外が発生したとき', () async {
    final mock = MockWeatherService();
    final container = ProviderContainer(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );
    addTearDown(container.dispose);
    when(mock.fetch(any)).thenThrow(WeatherInvalidResponseException);

    await container.read(weatherNotifierProvider.notifier).fetch(param);
    final value = container.read(weatherNotifierProvider);
    expect(value.error, WeatherInvalidResponseException);
  });
}
