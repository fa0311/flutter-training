import 'dart:convert';

import 'package:flutter_training/model/weather_error.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherService {
  WeatherService({YumemiWeather? client}) : _client = client ?? YumemiWeather();

  final YumemiWeather _client;

  String _serialize({required String area, required DateTime date}) {
    try {
      return jsonEncode(WeatherParameterModel(area: area, date: date).toJson());
    } on Exception {
      throw WeatherInvalidParameterException();
    }
  }

  String _request(String jsonString) {
    try {
      final response = _client.fetchWeather(jsonString);
      return response;
    } on YumemiWeatherError catch (e) {
      switch (e) {
        case YumemiWeatherError.invalidParameter:
          throw WeatherInvalidParameterException();
        case YumemiWeatherError.unknown:
          throw WeatherUnknownException();
      }
    }
  }

  WeatherResponseModel _deserialize(String raw) {
    try {
      final json = (jsonDecode(raw) as Map).cast<String, dynamic>();
      return WeatherResponseModel.fromJson(json);
    } on Exception {
      throw WeatherInvalidResponseException();
    }
  }

  WeatherResponseModel fetch({DateTime? date, String area = 'tokyo'}) {
    final jsonString = _serialize(area: area, date: date ?? DateTime.now());
    final raw = _request(jsonString);
    return _deserialize(raw);
  }
}
