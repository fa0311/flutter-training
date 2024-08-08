import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/component/action_buttons.dart';
import 'package:flutter_training/component/temperature.dart';
import 'package:flutter_training/component/weather_icon.dart';
import 'package:flutter_training/domain/weather_service.dart';
import 'package:flutter_training/model/weather_error.dart';
import 'package:flutter_training/model/weather_model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService weatherService = WeatherService();
  WeatherType? weatherType;
  int? maxTemperature;
  int? minTemperature;

  void _reloadWeather() {
    try {
      final model = WeatherParameterModel(area: 'tokyo', date: DateTime.now());
      final response = weatherService.fetch(model);
      setState(() {
        weatherType = response.weatherCondition;
        maxTemperature = response.maxTemperature;
        minTemperature = response.minTemperature;
      });
      debugPrint(weatherType.toString());
    } on WeatherInvalidResponseException catch (e) {
      _showAlertDialog(e.message);
      debugPrint(e.log);
    } on WeatherException catch (_) {
      _showAlertDialog();
    }
  }

  void _showAlertDialog([String? message]) {
    unawaited(
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('エラーが発生しました'),
            content: message != null ? Text(message) : null,
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      ),
    );
  }

  void _closeScreen() {
    Navigator.of(context).pop();
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
              AspectRatio(
                aspectRatio: 1,
                child: weatherType != null
                    ? WeatherIcon(weatherType: weatherType!)
                    : const Placeholder(),
              ),
              Temperature(
                minTemperature: minTemperature,
                maxTemperature: maxTemperature,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: ActionButtons(
                    closePressed: _closeScreen,
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
    properties.add(IntProperty('maxTemperature', maxTemperature));
    properties.add(IntProperty('minTemperature', minTemperature));
  }
}
