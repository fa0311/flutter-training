import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/controller/weather_controller.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:flutter_training/view/weather.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../test_util/finder.dart';
@GenerateNiceMocks([MockSpec<WeatherService>()])
import 'weather_test.mocks.dart';

void main() {
  final mock = MockWeatherService();
  final baseResponse = WeatherResponseModel(
    weatherCondition: WeatherType.sunny,
    maxTemperature: 10,
    minTemperature: -10,
    date: DateTime(2020),
  );

  testWidgets('気温が正しく表示されているかどうか', (tester) async {
    setPhysicalSize(tester);
    when(mock.fetch(any)).thenReturn(baseResponse);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherServiceProvider.overrideWithValue(mock),
        ],
        child: const MaterialApp(
          home: WeatherScreen(),
        ),
      ),
    );

    await tester.tap(find.text('Reload'));
    await tester.pumpAndSettle();
    expect(find.text('10 ℃'), findsOneWidget);
    expect(find.text('-10 ℃'), findsOneWidget);
  });

  testWidgets('sunnyが正しく表示されているかどうか', (tester) async {
    setPhysicalSize(tester);
    when(mock.fetch(any)).thenReturn(
      baseResponse.copyWith(
        weatherCondition: WeatherType.sunny,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherServiceProvider.overrideWithValue(mock),
        ],
        child: const MaterialApp(
          home: WeatherScreen(),
        ),
      ),
    );

    await tester.tap(find.text('Reload'));
    await tester.pumpAndSettle();
    expect(find.findBySvgPicture(Assets.weather.sunny.svg()), findsOneWidget);
  });

  testWidgets('cloudyが正しく表示されているかどうか', (tester) async {
    setPhysicalSize(tester);
    when(mock.fetch(any)).thenReturn(
      baseResponse.copyWith(
        weatherCondition: WeatherType.cloudy,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherServiceProvider.overrideWithValue(mock),
        ],
        child: const MaterialApp(
          home: WeatherScreen(),
        ),
      ),
    );

    await tester.tap(find.text('Reload'));
    await tester.pumpAndSettle();
    expect(find.findBySvgPicture(Assets.weather.cloudy.svg()), findsOneWidget);
  });

  testWidgets('rainyが正しく表示されているかどうか', (tester) async {
    setPhysicalSize(tester);
    when(mock.fetch(any)).thenReturn(
      baseResponse.copyWith(
        weatherCondition: WeatherType.rainy,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherServiceProvider.overrideWithValue(mock),
        ],
        child: const MaterialApp(
          home: WeatherScreen(),
        ),
      ),
    );

    await tester.tap(find.text('Reload'));
    await tester.pumpAndSettle();
    expect(find.findBySvgPicture(Assets.weather.rainy.svg()), findsOneWidget);
  });
}
