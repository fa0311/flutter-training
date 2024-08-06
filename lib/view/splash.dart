import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/util/end_of_frame_mixin.dart';
import 'package:flutter_training/view/weather.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with EndOfFrameMixin {
  _SplashScreenState();

  @override
  Future<void> endOfFrame() async {
    while (true) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      if (!mounted) {
        return;
      }
      final page = MaterialPageRoute<void>(
        builder: (context) {
          return const WeatherScreen();
        },
      );
      await Navigator.of(context).push(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: Colors.green);
  }
}
