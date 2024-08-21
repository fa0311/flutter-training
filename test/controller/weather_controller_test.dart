import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/controller/weather_controller.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<WeatherService>()])
import 'weather_controller_test.mocks.dart';

void main() {
  final mock = MockWeatherService();
  final response = WeatherResponseModel(
    weatherCondition: WeatherType.cloudy,
    maxTemperature: 0,
    minTemperature: 0,
    date: DateTime(2024),
  );
  final param = WeatherParameterModel(area: 'tokyo', date: DateTime(2024));

  test('fetchが呼び出されたかどうか', () {
    final container = ProviderContainer(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );
    addTearDown(container.dispose);

    when(mock.fetch(any)).thenReturn(response);
    final value = container.read(fetchWeatherProvider(param));
    verify(mock.fetch(any)).called(1);
    expect(value, isA<WeatherResponseModel>());
  });

  test('デフォルトがnullか', () {
    final container = ProviderContainer(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );
    addTearDown(container.dispose);

    final defaultState = container.read(weatherNotifierProvider);
    expect(defaultState, null);
  });

  test('stateを更新する', () {
    final container = ProviderContainer(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );
    addTearDown(container.dispose);

    container.read(weatherNotifierProvider.notifier).fetch(param);
    final value = container.read(weatherNotifierProvider);
    expect(value, isA<WeatherResponseModel>());
  });
}
