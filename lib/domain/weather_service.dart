import 'dart:convert';

import 'package:flutter_training/model/weather_error.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:flutter_training/util/enum.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

typedef WeatherResponseRecord = ({
  WeatherType weatherCondition,
  int maxTemperature,
  int minTemperature,
  DateTime date
});

class WeatherService {
  WeatherService({YumemiWeather? client}) : _client = client ?? YumemiWeather();

  final YumemiWeather _client;

  String _serialize({required String area, required DateTime date}) {
    return jsonEncode({
      'area': area,
      'date': date.toIso8601String(),
    });
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

  WeatherResponseRecord _deserialize(String raw) {
    try {
      final json = jsonDecode(raw);
      if (json is! Map<String, dynamic>) {
        throw WeatherInvalidResponseException();
      }
      final weatherType = json['weather_condition'].toString();
      return (
        weatherCondition: WeatherType.values.bySafeName(weatherType),
        maxTemperature: int.parse(json['max_temperature'].toString()),
        minTemperature: int.parse(json['min_temperature'].toString()),
        date: DateTime.parse(json['date'].toString()),
      );
    } on Exception {
      throw WeatherInvalidResponseException();
    }
  }

  WeatherResponseRecord fetch({required String area, required DateTime date}) {
    final jsonString = _serialize(area: area, date: date);
    final raw = _request(jsonString);
    return _deserialize(raw);
  }
}
