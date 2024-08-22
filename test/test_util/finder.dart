import 'dart:async';

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

class FakeFuture<T> {
  FakeFuture(this.any) : completer = Completer<T>();

  static void call<T>(T any, void Function(Future<T>) e) {
    final fake = FakeFuture(any);
    e(fake.future);
    fake.complete();
  }

  void complete() {
    completer.complete(any);
  }

  Future<T> get future => completer.future;

  final Completer<T> completer;
  final T any;
}
