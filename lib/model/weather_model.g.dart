// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherParameterModelImpl _$$WeatherParameterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherParameterModelImpl(
      area: json['area'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$WeatherParameterModelImplToJson(
        _$WeatherParameterModelImpl instance) =>
    <String, dynamic>{
      'area': instance.area,
      'date': instance.date.toIso8601String(),
    };

_$WeatherResponseModelImpl _$$WeatherResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherResponseModelImpl(
      weatherCondition:
          $enumDecode(_$WeatherTypeEnumMap, json['weather_condition']),
      maxTemperature: (json['max_temperature'] as num).toInt(),
      minTemperature: (json['min_temperature'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$WeatherResponseModelImplToJson(
        _$WeatherResponseModelImpl instance) =>
    <String, dynamic>{
      'weather_condition': _$WeatherTypeEnumMap[instance.weatherCondition]!,
      'max_temperature': instance.maxTemperature,
      'min_temperature': instance.minTemperature,
      'date': instance.date.toIso8601String(),
    };

const _$WeatherTypeEnumMap = {
  WeatherType.sunny: 'sunny',
  WeatherType.cloudy: 'cloudy',
  WeatherType.rainy: 'rainy',
};
