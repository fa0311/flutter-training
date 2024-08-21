import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/controller/weather_controller.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:flutter_training/view/weather.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<WeatherService>()])
import 'weather_test.mocks.dart';

void main() {
  final mock = MockWeatherService();
  final response = WeatherResponseModel(
    weatherCondition: WeatherType.cloudy,
    maxTemperature: 10,
    minTemperature: -10,
    date: DateTime(2020),
  );

  testWidgets('天気が正しく表示されるかどうか', (tester) async {
    // デフォルトのサイズが小さすぎて画面からはみ出してしまう
    // https://stackoverflow.com/questions/53706569/how-to-test-flutter-widgets-on-different-screen-sizes
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(2400, 1600);

    when(mock.fetch(any)).thenReturn(response);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherServiceProvider.overrideWith((_) => mock),
        ],
        child: const MaterialApp(
          home: WeatherScreen(),
        ),
      ),
    );

    await tester.tap(find.text('Reload'));
    await tester.pumpAndSettle();

    // SVG が表示されていることを確認する
    expect(find.byType(SvgPicture), findsOneWidget);

    // 最高気温が表示されることを確認
    expect(find.text('10 ℃'), findsOneWidget);

    // 最低気温が表示されることを確認
    expect(find.text('-10 ℃'), findsOneWidget);
  });
}
