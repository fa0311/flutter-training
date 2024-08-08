import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

enum WeatherType {
  sunny,
  cloudy,
  rainy,
}

@freezed
class WeatherParameterModel with _$WeatherParameterModel {
  const factory WeatherParameterModel({
    required String area,
    required DateTime date,
  }) = _WeatherParameterModel;

  factory WeatherParameterModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherParameterModelFromJson(json);
}

@freezed
class WeatherResponseModel with _$WeatherResponseModel {
  const factory WeatherResponseModel({
    required WeatherType weatherCondition,
    required int maxTemperature,
    required int minTemperature,
    required DateTime date,
  }) = _WeatherResponseModel;

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseModelFromJson(json);
}
