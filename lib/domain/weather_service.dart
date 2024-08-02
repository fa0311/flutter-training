import 'package:flutter_training/model/weather_model.dart';
import 'package:flutter_training/util/enum.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherService {
  WeatherService(YumemiWeather? client) : _client = client ?? YumemiWeather();

  final YumemiWeather _client;

  WeatherType fetch() {
    final response = _client.fetchSimpleWeather();
    return WeatherType.values.bySafeName(response);
  }
}
