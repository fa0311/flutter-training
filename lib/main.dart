import 'package:flutter/material.dart';
import 'package:flutter_training/component/action_buttons.dart';
import 'package:flutter_training/component/temperature.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Column(
              children: [
                Spacer(),
                Flexible(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Placeholder(),
                      ),
                      Temperature(),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: ActionButtons(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
