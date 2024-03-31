import 'package:Iraq/features/map/screens/map.dart';
import 'package:Iraq/features/personalization/screens/learning/details_screen.dart';
import 'package:Iraq/utils/constants/enums.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../map/controllers/map_controller.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MapController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iraqi Provinces"),
      ),
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 1; i < Province.values.length/2; i++)
                    ElevatedButton(
                      onPressed: () {
                        controller.updateProvinceByButton(Province.values[i]);
                        Get.to(() => const DetailsScreen());
                      },
                      child: Text(Province.values[i].title.tr),
                    ),
                ],
              ),
            ),
            const Expanded(
              flex: 3,
              child: InteractiveMap(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = Province.values.length~/2+1; i < Province.values.length; i++)
                    ElevatedButton(
                      onPressed: () {
                        controller.updateProvinceByButton(Province.values[i]);
                        Get.to(() => const DetailsScreen());
                      },
                      child: Text(Province.values[i].title.tr),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
