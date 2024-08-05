import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:path/path.dart' as p;

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({required this.weatherType, super.key});
  final WeatherType weatherType;

  @override
  Widget build(BuildContext context) {
    final path = p.join('assets', 'weather', '${weatherType.name}.svg');
    return SvgPicture.asset(path);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<WeatherType>('weatherType', weatherType));
  }
}
