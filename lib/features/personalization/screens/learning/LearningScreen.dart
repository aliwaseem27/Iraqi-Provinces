import 'package:Iraq/features/map/screens/map.dart';
import 'package:Iraq/features/personalization/screens/learning/details_screen.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iraqi Provinces"),
      ),
      body: Container(
        padding: EdgeInsets.all(MSizes.defaultSize),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [for (int i = 0; i < 9; i++) ElevatedButton(onPressed: () => Get.to(()=> const DetailsScreen()), child: Text("Province"))],
              ),
            ),
            Expanded(
              flex: 3,
              child: InteractiveMap(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 9; i++) ElevatedButton(onPressed: () {}, child: Text("Province")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
