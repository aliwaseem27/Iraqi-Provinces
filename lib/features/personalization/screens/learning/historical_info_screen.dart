import 'package:Iraq/features/map/controllers/map_controller.dart';
import 'package:Iraq/features/personalization/controllers/historical_info_controller.dart';
import 'package:Iraq/utils/constants/image_strings.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class HistoricalInfoScreen extends StatelessWidget {
  const HistoricalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoricalInfoController());
    return Scaffold(
      appBar: AppBar(
        title: Text("moreAbout".tr + MapController.instance.selectedProvince.value.title.tr),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(MSizes.defaultSize),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: FutureBuilder(
                        future: controller.loadMarkdownAsset(),
                        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            return Markdown(
                              data: snapshot.data!,
                              styleSheet: MarkdownStyleSheet(
                                textScaler: const TextScaler.linear(1.2),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return const Text('Error loading Info');
                          }
                          return const Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: MSizes.spaceBetweenSections),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(MImages.historical_baghdad),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
