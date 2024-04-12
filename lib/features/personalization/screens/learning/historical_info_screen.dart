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
                flex: 2,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromRGBO(101, 107, 245, 1), width: 5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          controller.getFirstProvinceImage(),
                        ),
                      ),
                    ),
                    SizedBox(height: MSizes.spaceBetweenSections),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromRGBO(101, 107, 245, 1), width: 5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          controller.getSecondProvinceImage(),
                        ),
                      ),
                    ),
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
