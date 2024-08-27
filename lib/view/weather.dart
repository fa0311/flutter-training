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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherResponse = ref.watch(weatherNotifierProvider);

    Future<void> showErrorDialog(String? message) async {
      return showDialog<void>(
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
      );
    }

    ref.listen(weatherNotifierProvider, (prev, next) async {
      await next.map(
        data: (data) {
          Navigator.of(context).pop();
        },
        loading: (loading) async {
          await showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          );
        },
        error: (error) async {
          Navigator.of(context).pop();
          final value = error.error;
          if (value is WeatherException) {
            await showErrorDialog(value.message);
          } else {
            await showErrorDialog('天気の取得に失敗しました');
          }
        },
      );
    });

    Future<void> reloadWeather() async {
      final param = WeatherParameterModel(
        area: 'tokyo',
        date: DateTime.now(),
      );
      await ref.read(weatherNotifierProvider.notifier).fetch(param);
    }

    void closeScreen() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              AspectRatio(
                aspectRatio: 1,
                child: switch (weatherResponse) {
                  AsyncValue(:final WeatherResponseModel value) =>
                    WeatherIcon(weatherType: value.weatherCondition),
                  _ => const Placeholder()
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Temperature(
                  minTemperature: weatherResponse.valueOrNull?.minTemperature,
                  maxTemperature: weatherResponse.valueOrNull?.maxTemperature,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: ActionButtons(
                    onClosePressed: closeScreen,
                    onReloadPressed: reloadWeather,
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
