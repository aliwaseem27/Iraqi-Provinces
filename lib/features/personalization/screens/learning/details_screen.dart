import 'package:Iraq/features/map/controllers/map_controller.dart';
import 'package:Iraq/features/personalization/screens/learning/historical_info_screen.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../map/screens/map.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MapController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.pressedCountry.value.name)),
      ),
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InteractiveMap(),
            ),
            const SizedBox(width: MSizes.spaceBetweenSections),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Title
                Text("Baghdad", style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(height: MSizes.spaceBetweenSections),

                // Common Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Area
                    Text("Area:", style: Theme.of(context).textTheme.titleLarge),
                    Text("360,000 Km2", style: Theme.of(context).textTheme.headlineLarge),
                    const SizedBox(height: MSizes.spaceBetweenSections),

                    // Population
                    Text("Population:", style: Theme.of(context).textTheme.titleLarge),
                    Text("8,000,000", style: Theme.of(context).textTheme.headlineLarge),
                    const SizedBox(height: MSizes.spaceBetweenSections),

                    // Capital
                    Text("Capital:", style: Theme.of(context).textTheme.titleLarge),
                    Text("Baghdad City", style: Theme.of(context).textTheme.headlineLarge),
                    const SizedBox(height: MSizes.spaceBetweenSections),

                    // Interesting Fact
                    Text("Interesting Fact:", style: Theme.of(context).textTheme.titleLarge),
                    Text("Most populated city in Iraq", style: Theme.of(context).textTheme.headlineLarge),
                  ],
                ),

                // MoreDetails Button
                const SizedBox(height: MSizes.spaceBetweenSections),
                ElevatedButton(
                    onPressed: () => Get.to(() => const HistoricalInfoScreen()),
                    child: Text("More Detailed Historical Info")),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
