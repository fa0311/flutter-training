import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/view/weather.dart';
import 'package:robot/robot.dart';

import '../test_util/finder.dart';

class WeatherScreenRobot extends Robot<WeatherScreen> {
  WeatherScreenRobot(super.tester);

  Finder svgFinder(SvgPicture svg) =>
      find.descendant(of: this, matching: find.findBySvgPicture(svg));

  Finder textFinder(String text) =>
      find.descendant(of: this, matching: find.text(text));

  Finder textDialogFinder(String text) =>
      find.descendant(of: find.byType(Dialog), matching: find.text(text));

  Future<void> show({required List<Override> overrides}) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(2400, 1600);
    await tester.pumpWidget(
      ProviderScope(
        overrides: overrides,
        child: const MaterialApp(
          home: WeatherScreen(),
        ),
      ),
    );
  }

  Future<void> tapReload() async {
    await tester.tap(find.text('Reload'));
    await tester.pumpAndSettle();
  }

  void expectSunnyIcon() =>
      expect(svgFinder(Assets.weather.sunny.svg()), findsOneWidget);

  void expectCloudyIcon() =>
      expect(svgFinder(Assets.weather.cloudy.svg()), findsOneWidget);

  void expectRainyIcon() =>
      expect(svgFinder(Assets.weather.rainy.svg()), findsOneWidget);

  void expectFindText(String text) => expect(textFinder(text), findsOneWidget);
  void expectFindTextDialog(String text) =>
      expect(textDialogFinder(text), findsOneWidget);
}
