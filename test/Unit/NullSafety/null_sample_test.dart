// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/NullSafety/null_sample.dart';

void main() {
  test("method1", () {
    var nullSample = NullSample();
    nullSample.method1();
  });

  test("method2", () {
    var nullSample = NullSample();

    try {
      nullSample.method2();
    } catch (e) {
      print("Exception: " + e.toString());
    }
  });
}
