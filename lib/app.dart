import 'dart:ui';

import 'package:Iraq/features/personalization/screens/main_menu/main_menu_screen.dart';
import 'package:Iraq/localization/language_controller.dart';
import 'package:Iraq/localization/translations.dart';
import 'package:Iraq/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageController());
    return GetMaterialApp(
      title: "School Project",
      home: const MainMenuScreen(),
      theme: MAppTheme.lightTheme,
      scrollBehavior: CustomScrollBehavior(),
      translations: Messages(),
      locale: const Locale("en_US"),
      fallbackLocale: const Locale("ar_IQ"),
      textDirection: controller.textDirection.value,
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
