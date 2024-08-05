import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/model/weather_model.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({required this.weatherType, super.key});
  final WeatherType weatherType;

  String getPath() {
    switch (weatherType) {
      case WeatherType.sunny:
        return Assets.weather.sunny;
      case WeatherType.cloudy:
        return Assets.weather.cloudy;
      case WeatherType.rainy:
        return Assets.weather.rainy;
    }
  }

  @override
  Widget build(BuildContext context) {
    final path = getPath();
    return SvgPicture.asset(path);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<WeatherType>('weatherType', weatherType));
  }
}
