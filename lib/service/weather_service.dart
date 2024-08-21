import 'dart:convert';
import 'dart:isolate';

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

  Future<String> _request(String jsonString) async {
    try {
      final response = await Isolate.run(() {
        return _client.syncFetchWeather(jsonString);
      });
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

  Future<WeatherResponseModel> fetch(WeatherParameterModel model) async {
    final jsonString = _serialize(model);
    final raw = await _request(jsonString);
    return _deserialize(raw);
  }
}
