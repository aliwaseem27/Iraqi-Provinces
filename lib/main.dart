import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'app.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    win.minSize = Size(900, 700);
    win.alignment = Alignment.center;
    appWindow.title = "School Project";
  });
}