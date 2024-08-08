import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/domain/weather_service.dart';
import 'package:flutter_training/model/weather_error.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

@GenerateNiceMocks([MockSpec<YumemiWeather>()])
import 'weather_service_test.mocks.dart';

void main() {
  test('fetch が動作するかどうか', () async {
    final mock = MockYumemiWeather();
    final service = WeatherService(client: mock);

    const path = 'test/assets/fetch_weather.json';
    final jsonString = await File(path).readAsString();

    when(mock.fetchWeather(any)).thenReturn(jsonString);
    final param = WeatherParameterModel(area: 'tokyo', date: DateTime.now());
    final _ = service.fetch(param);
  });

  test('fetch でAPIに invalidParameter エラーが発生したとき', () {
    final mock = MockYumemiWeather();
    final service = WeatherService(client: mock);
    final param = WeatherParameterModel(area: 'tokyo', date: DateTime.now());

    when(mock.fetchWeather(any)).thenThrow(YumemiWeatherError.invalidParameter);
    expect(
      () => service.fetch(param),
      throwsA(const TypeMatcher<WeatherInvalidParameterException>()),
    );
  });

  test('fetch でAPIに unknown エラーが発生したとき', () {
    final mock = MockYumemiWeather();
    final service = WeatherService(client: mock);
    final param = WeatherParameterModel(area: 'tokyo', date: DateTime.now());

    when(mock.fetchWeather(any)).thenThrow(YumemiWeatherError.unknown);
    expect(
      () => service.fetch(param),
      throwsA(const TypeMatcher<WeatherUnknownException>()),
    );
  });
}
