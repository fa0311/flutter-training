import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

extension CommonFindersExt on CommonFinders {
  Finder findBySvgPicture(SvgPicture svg) {
    final finder = byWidgetPredicate((widget) {
      if (widget is SvgPicture) {
        return widget.bytesLoader == svg.bytesLoader;
      }
      return false;
    });
    return finder;
  }
}

void setPhysicalSize(WidgetTester tester) {
  // デフォルトのサイズが小さすぎて画面からはみ出してしまう
  // https://stackoverflow.com/questions/53706569/how-to-test-flutter-widgets-on-different-screen-sizes
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = const Size(2400, 1600);
}
