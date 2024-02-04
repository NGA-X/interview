import 'package:flutter/material.dart';

class NYColor {
  static Color lineColor() {
    return NYColor.formColor("#E1E1E1");
  }

  static Color fontColor() {
    return NYColor.fontColorAlpha(1.0);
  }

  static Color fontColorAlpha(double alpha) {
    return NYColor.formColorAlpha("#007FFF", alpha);
  }

  static Color formColorAlpha(String rgbHex, double alpha) {
    int a = NYColor.alphaToInt(alpha);
    final buffer = StringBuffer();
    buffer.write('ff');
    buffer.write(rgbHex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16)).withAlpha(a);
  }

  static Color formColor(String rgbHex) {
    return NYColor.formColorAlpha(rgbHex, 1.0);
  }

  static int alphaToInt(double alpha) {
    if (alpha > 1.0) alpha = 1.0;
    if (alpha < 0) alpha = 0;
    return (alpha * 255).round();
  }
}
