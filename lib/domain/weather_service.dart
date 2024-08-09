import 'dart:convert';

import 'package:flutter_training/model/weather_error.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherService {
  WeatherService({YumemiWeather? client}) : _client = client ?? YumemiWeather();

  final YumemiWeather _client;

  String _serialize(WeatherParameterModel model) {
    return jsonEncode(model.toJson());
  }

  String _request(String jsonString) {
    try {
      final response = _client.fetchWeather(jsonString);
      return response;
    } on YumemiWeatherError catch (e) {
      switch (e) {
        case YumemiWeatherError.invalidParameter:
          throw const WeatherInvalidParameterException('Invalid Parameter');
        case YumemiWeatherError.unknown:
          throw const WeatherUnknownException('Unknown');
      }
    }
  }

  WeatherResponseModel _deserialize(String raw) {
    try {
      final json = jsonDecode(raw);
      if (json is! Map<String, dynamic>) {
        throw FormatException('Unexpected type', json);
      }
      return WeatherResponseModel.fromJson(json);
    } on FormatException catch (e) {
      throw WeatherInvalidResponseException(e.message, e.toString());
    } on CheckedFromJsonException catch (e) {
      throw WeatherInvalidResponseException(e.message, e.toString());
    }
  }

  WeatherResponseModel fetch(WeatherParameterModel model) {
    final jsonString = _serialize(model);
    final raw = _request(jsonString);
    return _deserialize(raw);
  }
}
