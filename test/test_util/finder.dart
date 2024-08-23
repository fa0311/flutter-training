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
