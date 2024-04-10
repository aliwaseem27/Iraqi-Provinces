import 'package:Iraq/common/widgets/purple_background_container.dart';
import 'package:Iraq/data/repositories/exam_repository.dart';
import 'package:Iraq/features/exam/controllers/exam_controller.dart';
import 'package:Iraq/features/exam/screens/questions/questions.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:numberpicker/numberpicker.dart';

class StartExamScreen extends StatelessWidget {
  const StartExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final examController = Get.put(ExamController());

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title, Subtitle
            Column(
              children: [
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
                Text(
                  "chooseNumberOfQuestions".tr,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: MSizes.spaceBetweenSections),
              ],
            ),

            // Number of questions selection
            Obx(
              () => NumberPicker(
                minValue: 5,
                maxValue: 25,
                axis: Axis.horizontal,
                value: examController.numberOfQuestions.value,
                onChanged: (value) {
                  examController.chooseNumberOfQuestions(value);
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
