import 'package:Iraq/data/repositories/exam_repository.dart';
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
    final mapController = Get.put(MapController());
    final examRepo = Get.put(ExamRepository());
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
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
                            width: 300,
                            height: 300,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(MSizes.spaceBetweenSections),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Text("mainPageTitle".tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
                              const SizedBox(height: MSizes.spaceBetweenSections),

                              // SubTitle
                              Text("mainPageSubtitle".tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(color: Colors.white, fontWeight: FontWeight.w400)),
                              const SizedBox(height: MSizes.spaceBetweenSections),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Options
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OnHoverButton(
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => const LearningScreen()),
                          child: Row(
                            children: [
                              const Icon(Icons.book_outlined),
                              const SizedBox(width: MSizes.spaceBetweenSections),
                              Text(
                                "startLearning".tr,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: MSizes.spaceBetweenSections),
                      OnHoverButton(
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => const ExploreScreen()),
                          child: Row(
                            children: [
                              const Icon(Icons.map_outlined),
                              const SizedBox(width: MSizes.spaceBetweenSections),
                              Text(
                                "exploreMaps".tr,
                                style: const TextStyle(color: Colors.black),
                              ),
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
                                const Icon(Icons.question_answer_outlined),
                                const SizedBox(width: MSizes.spaceBetweenSections),
                                Text(
                                  "challengeYourself".tr,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(height: MSizes.spaceBetweenSections),
                      OnHoverButton(
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => const AboutUsScreen()),
                          child: Row(
                            children: [
                              const Icon(Icons.info_outlined),
                              const SizedBox(width: MSizes.spaceBetweenSections),
                              Text(
                                "aboutUs".tr,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: MSizes.spaceBetweenSections),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   "chooseALanguage".tr,
                      //   style: Theme.of(context).textTheme.bodyMedium,
                      // ),
                      // const SizedBox(height: MSizes.spaceBetweenSections / 2),
                      Row(
                        children: [
                          OnHoverButton(
                            child: ElevatedButton(
                                onPressed: () => languageController.chooseEnglish(),
                                child: const Text(
                                  "English",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          const SizedBox(width: MSizes.spaceBetweenSections),
                          OnHoverButton(
                            child: ElevatedButton(
                                onPressed: () => languageController.chooseArabic(),
                                child: const Text(
                                  "العربية",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(width: MSizes.spaceBetweenSections),

            // Map
            Expanded(
              flex: 2,
              child: Hero(
                tag: "iraqMap",
                child: SizedBox.expand(
                  child: FittedBox(
                    child: SvgPicture.asset(MImages.iraqMap, fit: BoxFit.cover),
                  ),
                ),
                // child: SvgPicture.asset(MImages.iraqMap, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
