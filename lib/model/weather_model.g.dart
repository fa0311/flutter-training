// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherParameterModelImpl _$$WeatherParameterModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$WeatherParameterModelImpl',
      json,
      ($checkedConvert) {
        final val = _$WeatherParameterModelImpl(
          area: $checkedConvert('area', (v) => v as String),
          date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$WeatherParameterModelImplToJson(
        _$WeatherParameterModelImpl instance) =>
    <String, dynamic>{
      'area': instance.area,
      'date': instance.date.toIso8601String(),
    };

_$WeatherResponseModelImpl _$$WeatherResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$WeatherResponseModelImpl',
      json,
      ($checkedConvert) {
        final val = _$WeatherResponseModelImpl(
          weatherCondition: $checkedConvert(
              'weather_condition', (v) => $enumDecode(_$WeatherTypeEnumMap, v)),
          maxTemperature:
              $checkedConvert('max_temperature', (v) => (v as num).toInt()),
          minTemperature:
              $checkedConvert('min_temperature', (v) => (v as num).toInt()),
          date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'weatherCondition': 'weather_condition',
        'maxTemperature': 'max_temperature',
        'minTemperature': 'min_temperature'
      },
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
