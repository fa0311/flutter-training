import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/component/action_buttons.dart';
import 'package:flutter_training/component/temperature.dart';
import 'package:flutter_training/component/weather_icon.dart';
import 'package:flutter_training/controller/weather_controller.dart';
import 'package:flutter_training/model/weather_error.dart';
import 'package:flutter_training/model/weather_model.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  void _reloadWeather(BuildContext context, WidgetRef ref) {
    try {
      final param = WeatherParameterModel(area: 'tokyo', date: DateTime.now());
      ref.read(weatherNotifierProvider.notifier).fetch(param);
    } on WeatherException catch (e) {
      unawaited(
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('エラーが発生しました'),
              content: e.message != null ? Text(e.message!) : null,
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
  }

  void _closeScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherResponse = ref.watch(weatherNotifierProvider);

    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              AspectRatio(
                aspectRatio: 1,
                child: weatherResponse != null
                    ? WeatherIcon(weatherType: weatherResponse.weatherCondition)
                    : const Placeholder(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Temperature(
                  minTemperature: weatherResponse?.minTemperature,
                  maxTemperature: weatherResponse?.maxTemperature,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: ActionButtons(
                    onClosePressed: () => _closeScreen(context),
                    onReloadPressed: () => _reloadWeather(context, ref),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
