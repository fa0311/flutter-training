import 'package:flutter_training/model/weather_model.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_controller.g.dart';

@Riverpod(keepAlive: true)
WeatherService weatherService(WeatherServiceRef ref) {
  return WeatherService();
}

@Riverpod(keepAlive: true)
Future<WeatherResponseModel> fetchWeather(
  FetchWeatherRef ref,
  WeatherParameterModel param,
) {
  final service = ref.watch(weatherServiceProvider);
  return service.fetch(param);
}

@riverpod
class WeatherNotifier extends _$WeatherNotifier {
  @override
  FutureOr<WeatherResponseModel?> build() {
    return null;
  }

  Future<void> fetch(WeatherParameterModel param) async {
    if (state.isLoading) {
      return;
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return ref.read(fetchWeatherProvider(param).future);
    });
  }
}
