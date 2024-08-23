import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/controller/weather_controller.dart';
import 'package:flutter_training/model/weather_error.dart';
import 'package:flutter_training/model/weather_model.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_robot.dart';
@GenerateNiceMocks([MockSpec<WeatherService>()])
import 'weather_test.mocks.dart';

void main() {
  final mock = MockWeatherService();
  final baseResponse = WeatherResponseModel(
    weatherCondition: WeatherType.sunny,
    maxTemperature: 0,
    minTemperature: 0,
    date: DateTime(2020),
  );

  testWidgets('気温が表示されているかどうか', (tester) async {
    final robot = WeatherScreenRobot(tester);
    when(mock.fetch(any)).thenReturn(
      baseResponse.copyWith(
        maxTemperature: 10,
        minTemperature: -10,
      ),
    );

    await robot.show(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );

    await robot.tapReload();
    robot.expectFindText('10 ℃');
    robot.expectFindText('-10 ℃');
  });

  testWidgets('sunnyが表示されているかどうか', (tester) async {
    final robot = WeatherScreenRobot(tester);
    when(mock.fetch(any)).thenReturn(
      baseResponse.copyWith(
        weatherCondition: WeatherType.sunny,
      ),
    );

    await robot.show(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );

    await robot.tapReload();
    robot.expectSunnyIconDisplayed();
  });

  testWidgets('cloudyが表示されているかどうか', (tester) async {
    final robot = WeatherScreenRobot(tester);
    when(mock.fetch(any)).thenReturn(
      baseResponse.copyWith(
        weatherCondition: WeatherType.cloudy,
      ),
    );

    await robot.show(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );

    await robot.tapReload();
    robot.expectCloudyIconDisplayed();
  });

  testWidgets('rainyが表示されているかどうか', (tester) async {
    final robot = WeatherScreenRobot(tester);
    when(mock.fetch(any)).thenReturn(
      baseResponse.copyWith(
        weatherCondition: WeatherType.rainy,
      ),
    );

    await robot.show(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );

    await robot.tapReload();
    robot.expectRainyIconDisplayed();
  });

  testWidgets('Exception発生時, 特定のメッセージが表示されているかどうか', (tester) async {
    final robot = WeatherScreenRobot(tester);
    when(mock.fetch(any)).thenThrow(
      const WeatherUnknownException('Unknown'),
    );

    await robot.show(
      overrides: [
        weatherServiceProvider.overrideWithValue(mock),
      ],
    );

    await robot.tapReload();
    robot.expectFindDialogText('Unknown');
  });
}
