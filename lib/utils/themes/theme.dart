import 'package:Iraq/utils/themes/widget_themes/elevated_button_theme.dart';
import 'package:flutter/material.dart';

class MAppTheme {
  MAppTheme._();

  // compile vs. run

  static ThemeData lightTheme = ThemeData(
    elevatedButtonTheme: MElevatedButtonTheme.lightElevatedButtonTheme,
    fontFamily: "NotoKufiArabic",
  );
}
