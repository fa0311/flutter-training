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

  test('serviceのfetchが呼び出されたとき, APIのfetchが1度だけ呼び出される', () async {
    const path = 'test/assets/fetch_weather.json';
    final jsonString = await File(path).readAsString();

    when(mock.fetchWeather(any)).thenReturn(jsonString);
    final value = service.fetch(param);

    verify(mock.fetchWeather(any)).called(1);
    expect(value, isA<WeatherResponseModel>());
  });

  test('APIにInvalidParameterエラーが発生したとき', () {
    when(mock.fetchWeather(any)).thenThrow(YumemiWeatherError.invalidParameter);
    expect(
      () => service.fetch(param),
      throwsA(const TypeMatcher<WeatherInvalidParameterException>()),
    );
  });

  test('APIにUnknownエラーが発生したとき', () {
    when(mock.fetchWeather(any)).thenThrow(YumemiWeatherError.unknown);
    expect(
      () => service.fetch(param),
      throwsA(const TypeMatcher<WeatherUnknownException>()),
    );
  });

  test('APIがJSON以外の応答を返したとき', () {
    when(mock.fetchWeather(any)).thenReturn('hello world!');
    expect(
      () => service.fetch(param),
      throwsA(const TypeMatcher<WeatherInvalidResponseException>()),
    );
  });

  test('APIがJSONを返したが、トップレベルがMAPではないとき', () {
    when(mock.fetchWeather(any)).thenReturn('"hello world!"');
    expect(
      () => service.fetch(param),
      throwsA(const TypeMatcher<WeatherInvalidResponseException>()),
    );
  });

  test('APIが異なるJSONフォーマットを返したとき', () {
    when(mock.fetchWeather(any)).thenReturn('{"key":"value"}');
    expect(
      () => service.fetch(param),
      throwsA(const TypeMatcher<WeatherInvalidResponseException>()),
    );
  });
}
