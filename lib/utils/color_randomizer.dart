import 'package:flutter/material.dart';
import 'dart:math' as math;

class ColorRandomizer {
  static Color getRandomColor(bool withOpacity) {
    Color generatedColor = withOpacity
        ? Color(math.Random().nextInt(0xffffffff)).withAlpha(math.Random().nextInt(0xff))
        : Color(math.Random().nextInt(0xffffffff));
    return generatedColor;
  }
}
