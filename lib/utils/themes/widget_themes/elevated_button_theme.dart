import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MElevatedButtonTheme {
  MElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: MSizes.spaceBetweenSections, horizontal: MSizes.spaceBetweenSections * 2),
      backgroundColor: const Color.fromRGBO(239, 241, 254, 1),
      side: const BorderSide(
        color: Color.fromRGBO(65, 76, 234, 1),
        width: 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      )
    ),
  );
}
