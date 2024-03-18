import 'package:flutter/material.dart';

class MHelperFunctions {
  static Color increaseSaturation(String colorString, {double increaseBy = 0.2}) {
    assert(increaseBy >= 0.0 && increaseBy <= 1.0, 'IncreaseBy must be between 0.0 and 1.0');

    Color color = colorFromRGB(colorString);
    // Convert the original color to HSL
    HSLColor hsl = HSLColor.fromColor(color);
    // Increase the saturation
    double newSaturation = (hsl.saturation + increaseBy).clamp(0.0, 1.0);
    // Create a new HSLColor with the adjusted saturation
    HSLColor newHsl = hsl.withSaturation(newSaturation);
    // Convert back to a Color object
    return newHsl.toColor();
  }

  static Color colorFromRGB (String colorString){
    return Color(int.parse("FF$colorString", radix: 16));
  }
}
