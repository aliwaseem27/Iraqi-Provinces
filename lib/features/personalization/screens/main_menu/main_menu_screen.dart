import 'package:Iraq/features/exam/screens/questions/questions.dart';
import 'package:Iraq/features/infographic/screens/explore_screen.dart';
import 'package:Iraq/common/widgets/on_hover_button.dart';
import 'package:Iraq/features/personalization/screens/about_us/about_us.dart';
import 'package:Iraq/features/personalization/screens/learning/LearningScreen.dart';
import 'package:Iraq/localization/language_controller.dart';
import 'package:Iraq/utils/constants/image_strings.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../map/controllers/map_controller.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    final languageController = LanguageController.instance;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Row(
          children: [
            // Title, Subtitle, Options and Language Selector
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      // Title
                      Text("mainPageTitle".tr, style: Theme.of(context).textTheme.headlineLarge),
                      const SizedBox(height: MSizes.spaceBetweenSections),

                      // SubTitle
                      Text("mainPageSubtitle".tr, style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: MSizes.spaceBetweenSections),
                    ],
                  ),

                  // Options
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OnHoverButton(
                        child: ElevatedButton(
                            onPressed: () => Get.to(() => const LearningScreen()), child: Row(
                              children: [
                                Icon(Icons.book_outlined),
                                SizedBox(width: MSizes.spaceBetweenSections),
                                Text("startLearning".tr),
                              ],
                            ),),
                      ),
                      const SizedBox(height: MSizes.spaceBetweenSections),
                      OnHoverButton(
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => const ExploreScreen()),
                          child: Row(
                            children: [
                              Icon(Icons.map_outlined),
                              SizedBox(width: MSizes.spaceBetweenSections),
                              Text("exploreMaps".tr),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: MSizes.spaceBetweenSections),
                      OnHoverButton(
                        child: ElevatedButton(
                            onPressed: () => Get.to(() => const QuestionsScreen()),
                            child: Row(
                              children: [
                                Icon(Icons.question_answer_outlined),
                                SizedBox(width: MSizes.spaceBetweenSections),
                                Text("challengeYourself".tr),
                              ],
                            )),
                      ),
                      const SizedBox(height: MSizes.spaceBetweenSections),
                      OnHoverButton(
                        child: ElevatedButton(
                            onPressed: () => Get.to(() => const AboutUsScreen()), child: Row(
                              children: [
                                Icon(Icons.info_outlined),
                                SizedBox(width: MSizes.spaceBetweenSections),
                                Text("aboutUs".tr),
                              ],
                            ),),
                      ),
                      const SizedBox(height: MSizes.spaceBetweenSections),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("chooseALanguage".tr),
                      const SizedBox(height: MSizes.spaceBetweenSections/2),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () => languageController.chooseEnglish(), child: const Text("English")),
                          const SizedBox(width: MSizes.spaceBetweenSections),
                          ElevatedButton(
                              onPressed: () => languageController.chooseArabic(), child: const Text("العربية")),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),

            // Map
            Expanded(
              flex: 2,
              child: Hero(
                tag: "iraqMap",
                child: Container(
                  child: SvgPicture.asset(MImages.iraqMap),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
