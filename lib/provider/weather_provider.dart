import 'package:flutter_training/domain/weather_service.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_provider.g.dart';

@Riverpod(keepAlive: true)
WeatherService weatherService(WeatherServiceRef ref) {
  return WeatherService();
}

@Riverpod(keepAlive: true)
WeatherResponseModel fetchWeather(
  FetchWeatherRef ref,
  WeatherParameterModel param,
) {
  final service = ref.read(weatherServiceProvider);
  return service.fetch(param);
}

@riverpod
class WeatherResponseState extends _$WeatherResponseState {
  @override
  WeatherResponseModel? build() {
    return null;
  }

  void change(WeatherParameterModel param) {
    state = ref.read(fetchWeatherProvider(param));
  }
}
