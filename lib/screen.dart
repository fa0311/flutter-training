import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/component/action_button.dart';
import 'package:flutter_training/component/temperature.dart';
import 'package:flutter_training/component/weather_icon.dart';
import 'package:flutter_training/domain/weather_service.dart';
import 'package:flutter_training/model/weather_model.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final WeatherService weatherService = WeatherService();
  WeatherType? weatherType;

  void _reloadWeather() {
    setState(() {
      try {
        weatherType = weatherService.fetch();
        debugPrint(weatherType.toString());
      } on Exception {
        weatherType = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              Flexible(
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: weatherType != null
                          ? WeatherIcon(weatherType: weatherType!)
                          : const Placeholder(),
                    ),
                    const Temperature(),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ActionButton(
                    closePressed: () {
                      throw UnimplementedError();
                    },
                    reloadPressed: _reloadWeather,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<WeatherService>('weatherService', weatherService),
    );
    properties.add(EnumProperty<WeatherType?>('weatherType', weatherType));
  }
}
