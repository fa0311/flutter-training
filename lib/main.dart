import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/component/action_buttons.dart';
import 'package:flutter_training/component/temperature.dart';
import 'package:flutter_training/domain/weather_service.dart';
import 'package:flutter_training/model/weather_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final WeatherService weatherService = WeatherService();
  WeatherType? weatherCondition;

  void _reloadWeather() {
    setState(() {
      try {
        weatherCondition = weatherService.fetch();
        debugPrint(weatherCondition.toString());
      } on Exception {
        weatherCondition = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Column(
              children: [
                const Spacer(),
                const AspectRatio(
                  aspectRatio: 1,
                  child: Placeholder(),
                ),
                const Temperature(),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: ActionButtons(
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
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<WeatherService>('weatherService', weatherService),
    );
    properties
        .add(EnumProperty<WeatherType?>('weatherCondition', weatherCondition));
  }
}
