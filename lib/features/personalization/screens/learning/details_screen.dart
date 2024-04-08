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
        title: Obx(() => Text(controller.selectedProvince.value.title.tr)),
      ),
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Hero(tag: "iraqMap", child: InteractiveMap()),
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
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color.fromRGBO(110, 143, 248, 1),
                              Color.fromRGBO(101, 107, 245, 1),
                            ],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: -50,
                              bottom: -180,
                              child: Container(
                                width: 300,
                                height: 300,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.white.withOpacity(0.05),
                                      Colors.white.withOpacity(0.2),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: MSizes.spaceBetweenSections),
                                  child: Obx(
                                    () => Text(
                                      controller.selectedProvince.value.title.tr,
                                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: MSizes.spaceBetweenSections),

                // Common Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Area
                    Text("Area:".tr, style: Theme.of(context).textTheme.titleLarge),
                    Obx(() => Text(
                          controller.selectedProvince.value.area + "Km2".tr,
                          style: Theme.of(context).textTheme.headlineLarge,
                        )),
                    const SizedBox(height: MSizes.spaceBetweenSections),

                    // Population
                    Text("Population:".tr, style: Theme.of(context).textTheme.titleLarge),
                    Obx(() => Text(controller.selectedProvince.value.population,
                        style: Theme.of(context).textTheme.headlineLarge)),
                    const SizedBox(height: MSizes.spaceBetweenSections),

                    // Capital
                    Text("Capital:".tr, style: Theme.of(context).textTheme.titleLarge),
                    Obx(() => Text(controller.selectedProvince.value.capitalCity.tr,
                        style: Theme.of(context).textTheme.headlineLarge)),
                    const SizedBox(height: MSizes.spaceBetweenSections),

                    // Interesting Fact
                    Text("Interesting Fact:".tr, style: Theme.of(context).textTheme.titleLarge),
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
                        child: Text(
                          "moreInfo".tr,
                          style: const TextStyle(color: Colors.black),
                        )),
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
