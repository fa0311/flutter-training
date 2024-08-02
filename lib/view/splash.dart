import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/view/weather.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState();

  Future<void> _navigation() async {
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
  void initState() {
    super.initState();
    unawaited(
      WidgetsBinding.instance.endOfFrame.then((_) => _navigation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: Colors.green);
  }
}
