import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/domain/weather_service.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:flutter_training/provider/weather_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<WeatherService>()])
import 'weather_provider_test.mocks.dart';

void main() {
  final mock = MockWeatherService();
  final response = WeatherResponseModel(
    weatherCondition: WeatherType.cloudy,
    maxTemperature: 0,
    minTemperature: 0,
    date: DateTime(2024),
  );
  final param = WeatherParameterModel(area: 'tokyo', date: DateTime(2024));
  final container = ProviderContainer(
    overrides: [
      weatherServiceProvider.overrideWith((_) => mock),
    ],
  );

  test('fetchが呼び出されたかどうか', () {
    addTearDown(container.dispose);
    when(mock.fetch(any)).thenReturn(response);
    final value = container.read(fetchWeatherProvider(param));
    verify(mock.fetch(any)).called(1);
    expect(value, isA<WeatherResponseModel>());
  });

  test('デフォルトがnullか', () {
    addTearDown(container.dispose);
    final defaultState = container.read(weatherResponseStateProvider);
    expect(defaultState, null);
  });

  test('stateを更新する', () {
    addTearDown(container.dispose);
    container.read(weatherResponseStateProvider.notifier).change(response);
    final value = container.read(weatherResponseStateProvider);
    expect(value, isA<WeatherResponseModel>());
  });
}
