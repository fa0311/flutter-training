import 'package:flutter_training/model/weather_model.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_controller.g.dart';

@Riverpod(keepAlive: true)
WeatherService weatherService(WeatherServiceRef ref) {
  return WeatherService();
}

@Riverpod(keepAlive: true)
WeatherResponseModel fetchWeather(
  FetchWeatherRef ref,
  WeatherParameterModel param,
) {
  final service = ref.watch(weatherServiceProvider);
  return service.fetch(param);
}

@riverpod
class WeatherNotifier extends _$WeatherNotifier {
  @override
  WeatherResponseModel? build() {
    return null;
  }

  void fetch(WeatherParameterModel param) {
    state = ref.read(fetchWeatherProvider(param));
  }
}
