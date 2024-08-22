import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/model/weather_error.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

@GenerateNiceMocks([MockSpec<YumemiWeather>()])
import 'weather_service_test.mocks.dart';

void main() {
  final mock = MockYumemiWeather();
  final service = WeatherService(client: mock);
  final param = WeatherParameterModel(area: 'tokyo', date: DateTime.now());

  test('serviceのfetchが呼び出されたとき, APIのfetchが呼び出される', () async {
    const path = 'test/assets/fetch_weather.json';
    final jsonString = await File(path).readAsString();
    final model = WeatherResponseModel(
      weatherCondition: WeatherType.sunny,
      maxTemperature: 25,
      minTemperature: -9,
      date: DateTime.parse('2024-08-07T14:54:04+09:00'),
    );

    when(mock.syncFetchWeather(any)).thenReturn(jsonString);
    final value = await service.fetch(param);

    expect(value, model);
  });

  test('APIにInvalidParameterエラーが発生したとき', () async {
    when(mock.syncFetchWeather(any))
        .thenThrow(YumemiWeatherError.invalidParameter);
    expect(
      service.fetch(param),
      throwsA(isA<WeatherInvalidParameterException>()),
    );
  });

  test('APIにUnknownエラーが発生したとき', () async {
    when(mock.syncFetchWeather(any)).thenThrow(YumemiWeatherError.unknown);
    expect(
      service.fetch(param),
      throwsA(isA<WeatherUnknownException>()),
    );
  });

  test('APIがJSON以外の応答を返したとき', () async {
    when(mock.syncFetchWeather(any)).thenReturn('hello world!');
    expect(
      service.fetch(param),
      throwsA(isA<WeatherInvalidResponseException>()),
    );
  });

  test('APIがJSONを返したが、トップレベルがMAPではないとき', () async {
    when(mock.syncFetchWeather(any)).thenReturn('"hello world!"');
    expect(
      () => service.fetch(param),
      throwsA(isA<WeatherInvalidResponseException>()),
    );
  });

  test('APIが異なるJSONフォーマットを返したとき', () async {
    when(mock.syncFetchWeather(any)).thenReturn('{"key":"value"}');
    expect(
      () => service.fetch(param),
      throwsA(isA<WeatherInvalidResponseException>()),
    );
  });
}
