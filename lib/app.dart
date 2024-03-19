import 'package:Iraq/features/map/screens/map.dart';
import 'package:Iraq/features/personalization/screens/main_menu/main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "School Project",
      home: MainMenu(),
    );
  }
}
