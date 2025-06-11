import 'dart:math';

import 'package:flutter/material.dart';

class ColorHelper {
  static Color fromIndex(int index) {
    // Seed the random number generator with the index
    final random = Random(index);
    final hue = random.nextDouble() * 360; // Generate a random hue (0-360)
    return HSLColor.fromAHSL(1.0, hue, 0.9, 0.7).toColor();
  }
}
