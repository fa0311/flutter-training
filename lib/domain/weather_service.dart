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
    final json = (jsonDecode(raw) as Map).cast<String, dynamic>();
    final weatherType = json['weather_condition'] as String;
    return (
      weatherCondition: WeatherType.values.bySafeName(weatherType),
      maxTemperature: json['max_temperature'] as int,
      minTemperature: json['min_temperature'] as int,
      date: DateTime.parse(json['date'] as String),
    );
  }

  WeatherResponseRecord fetch({required String area, required DateTime date}) {
    final jsonString = _serialize(area: area, date: date);
    final raw = _request(jsonString);
    return _deserialize(raw);
  }
}
