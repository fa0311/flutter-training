import 'package:flutter_training/model/weather_error.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:flutter_training/util/enum.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherService {
  WeatherService({YumemiWeather? client}) : _client = client ?? YumemiWeather();

  final YumemiWeather _client;

  String _request(String area) {
    try {
      final response = _client.fetchThrowsWeather(area);
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

  WeatherType _deserialize(String raw) {
    final response = WeatherType.values.byNameOrNull(raw);
    if (response == null) {
      throw WeatherInvalidResponseException();
    }
    return response;
  }

  WeatherType fetch(String area) {
    final raw = _request(area);
    return _deserialize(raw);
  }
}
