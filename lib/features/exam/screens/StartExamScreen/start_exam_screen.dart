import 'package:Iraq/common/widgets/purple_background_container.dart';
import 'package:Iraq/features/exam/controllers/start_exam_controller.dart';
import 'package:Iraq/features/exam/screens/questions/questions.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class StartExamScreen extends StatelessWidget {
  const StartExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StartExamController());

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title, Subtitle
            PurpleBackgroundContainer(
              child: Text(
                "startExamTitle".tr,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: MSizes.spaceBetweenSections * 2),

            // Number of questions selection
            Column(
              children: [
                Text(
                  "chooseNumberOfQuestions".tr,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: MSizes.spaceBetweenSections),
                Obx(
                  () => NumberPicker(
                    minValue: 5,
                    maxValue: 25,
                    axis: Axis.horizontal,
                    value: controller.numberOfQuestions.value,
                    onChanged: (value) {
                      controller.chooseNumberOfQuestions(value);
                    },
                    itemHeight: 100,
                    itemCount: 5,
                    selectedTextStyle: const TextStyle(color: Color.fromRGBO(101, 107, 245,1), fontWeight: FontWeight.bold, fontSize: 28),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black26),
                    ),
                  ),
                ),
              ],
            ),

            // Start Quiz Button
            ElevatedButton(
              onPressed: () => Get.to(() => const QuestionsScreen()),
              child: Text("startQuiz".tr),
            ),
          ],
        ),
      ),
    );
  }
}
