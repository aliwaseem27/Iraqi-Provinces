import 'package:Iraq/features/exam/screens/questions/questions.dart';
import 'package:Iraq/features/infographic/screens/explore_screen.dart';
import 'package:Iraq/features/map/screens/widgets/on_hover_button.dart';
import 'package:Iraq/features/personalization/screens/about_us/about_us.dart';
import 'package:Iraq/features/personalization/screens/learning/LearningScreen.dart';
import 'package:Iraq/utils/constants/image_strings.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../map/controllers/map_controller.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Row(
          children: [
            // Title, Subtitle, Options and Language Selector
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // Title
                    Text("Iraq Map", style: Theme.of(context).textTheme.headlineLarge),
                    const SizedBox(height: MSizes.spaceBetweenSections),

                    // SubTitle
                    Text("Interactive map for enjoyable learning experience",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: MSizes.spaceBetweenSections),
                  ],
                ),

                // Options
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OnHoverButton(
                        child: ElevatedButton(
                            onPressed: () => Get.to(() => const LearningScreen()), child: Text("Start Learning"))),
                    SizedBox(height: MSizes.spaceBetweenSections),
                    ElevatedButton(onPressed: () => Get.to(() => const ExploreScreen()), child: Text("Explore Maps")),
                    SizedBox(height: MSizes.spaceBetweenSections),
                    ElevatedButton(onPressed: () => Get.to(()=> const QuestionsScreen()), child: Text("Challenge yourself")),
                    SizedBox(height: MSizes.spaceBetweenSections),
                    ElevatedButton(onPressed: () => Get.to(() => const AboutUsScreen()), child: Text("About us")),
                    SizedBox(height: MSizes.spaceBetweenSections),
                  ],
                ),

                Column(
                  children: [
                    Text("Choose a language:"),
                    Row(
                      children: [
                        ElevatedButton(onPressed: () {}, child: Text("English")),
                        SizedBox(width: MSizes.spaceBetweenSections),
                        ElevatedButton(onPressed: () {}, child: Text("العربية")),
                      ],
                    )
                  ],
                )
              ],
            ),

            // Map
            Expanded(
              flex: 2,
              child: Container(
                child: SvgPicture.asset(MImages.iraqMap),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
