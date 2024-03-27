import 'package:Iraq/features/map/controllers/map_controller.dart';
import 'package:Iraq/features/personalization/screens/learning/historical_info_screen.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';

import '../../../map/screens/map.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MapController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.selectedProvince.value.title)),
      ),
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: InteractiveMap(),
            ),
            const SizedBox(width: MSizes.spaceBetweenSections),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Text(
                          controller.selectedProvince.value.title,
                          style: Theme.of(context).textTheme.displayLarge,
                        )),
                  ],
                ),
                const SizedBox(height: MSizes.spaceBetweenSections),

                // Common Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Area
                    Text("Area:", style: Theme.of(context).textTheme.titleLarge),
                    Obx(() => Text("${controller.selectedProvince.value.area} Km2",
                        style: Theme.of(context).textTheme.headlineLarge)),
                    const SizedBox(height: MSizes.spaceBetweenSections),

                    // Population
                    Text("Population:", style: Theme.of(context).textTheme.titleLarge),
                    Obx(() => Text(controller.selectedProvince.value.population,
                        style: Theme.of(context).textTheme.headlineLarge)),
                    const SizedBox(height: MSizes.spaceBetweenSections),

                    // Capital
                    Text("Capital:", style: Theme.of(context).textTheme.titleLarge),
                    Obx(() => Text(controller.selectedProvince.value.capitalCity,
                        style: Theme.of(context).textTheme.headlineLarge)),
                    const SizedBox(height: MSizes.spaceBetweenSections),

                    // Interesting Fact
                    Text("Interesting Fact:", style: Theme.of(context).textTheme.titleLarge),
                    Obx(
                      () => Text(
                        controller.selectedProvince.value.interestingFact,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),

                // MoreDetails Button
                const SizedBox(height: MSizes.spaceBetweenSections),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () => Get.to(() => const HistoricalInfoScreen()),
                        child: const Text("More Detailed Historical Info")),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
