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

  test('controllerのfetchが呼び出されたとき, serviceのfetchが呼び出される', () async {
    final container = ProviderContainer(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );
    addTearDown(container.dispose);
    when(mock.fetch(any)).thenReturn(response);

    container.read(weatherNotifierProvider.notifier).fetch(param);

    verify(mock.fetch(any)).called(1);
  });

  test('controllerのfetchが呼び出されたとき, Notifierの値が更新される', () {
    final container = ProviderContainer(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );
    addTearDown(container.dispose);
    when(mock.fetch(any)).thenReturn(response);

    final value1 = container.read(weatherNotifierProvider);
    expect(value1, null);

    container.read(weatherNotifierProvider.notifier).fetch(param);
    final value2 = container.read(weatherNotifierProvider);
    expect(value2, response);
  });
}
