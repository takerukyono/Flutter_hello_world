// ignore_for_file: avoid_print

import 'dart:math' as math;

class NullSample {
  method1() {
    int x = 10;
    int? y = getNullable();

    if (y != null) {
      x = y;
    }
    print("x: " + x.toString() + " y: " + y.toString());
  }

  method2() {
    int x = 10;
    int? y = getNullable();

    x = y!;
    print("x: " + x.toString() + " y: " + y.toString());
  }

  getNullable() {
    var rand = math.Random();
    if (rand.nextInt(2) == 0) {
      return null;
    }
    return 1;
  }
}
