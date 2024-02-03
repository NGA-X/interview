import 'package:flutter/material.dart';

class NYColor {
  static Color formColor(String rgbHex) {
    final buffer = StringBuffer();
    buffer.write('ff');
    buffer.write(rgbHex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static int alphaToInt(double alpha) {
    if (alpha > 1.0) alpha = 1.0;
    if (alpha < 0) alpha = 0;
    return (alpha * 255).round();
  }
}