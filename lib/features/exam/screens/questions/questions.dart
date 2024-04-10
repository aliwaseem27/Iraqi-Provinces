import 'package:Iraq/features/exam/controllers/exam_controller.dart';
import 'package:Iraq/features/exam/screens/results/results.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExamController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose the correct answer"),
      ),
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress Bar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Obx(
                      () => Text(
                        "${(controller.currentQuestionIndex.value / controller.questions.length * 100).toInt()}%${"completed".tr}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Obx(() => TweenAnimationBuilder<double>(
                          tween: Tween<double>(
                            begin: 0,
                            end: controller.currentQuestionIndex.value / controller.questions.length,
                          ),
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          builder: (context, value, _) {
                            return LinearProgressIndicator(
                              value: value,
                              minHeight: 16,
                              borderRadius: BorderRadius.circular(12),
                              valueColor: const AlwaysStoppedAnimation<Color>(Color.fromRGBO(110, 143, 248, 1)),
                            );
                          },
                        )),
                    const SizedBox(height: MSizes.spaceBetweenSections * 2),
                  ],
                ),

                // Question Title
                Obx(() => Text(
                      "Q/ ${controller.getQuestionText()}",
                      style: Theme.of(context).textTheme.displaySmall,
                    )),
                const SizedBox(height: MSizes.spaceBetweenSections * 2),
              ],
            ),

            // Choices
            Obx(
              () => Column(
                children: List.generate(controller.getCurrentOptions().length, (index) {
                  return InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text(controller.getCurrentOptions()[index]),
                      leading: Radio(
                        value: index,
                        groupValue: controller.selectedOptionIndex.value,
                        onChanged: (int? value) {
                          if (value != null) {
                            controller.selectOption(value);
                          }
                        },
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Next Button
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (!controller.isQuizCompleted()) {
                          controller.nextQuestion();
                        } else {
                          // Show results or reset the quiz
                          controller.increaseScore();
                          Get.offAll(() => const ResultsScreen());
                        }
                      },
                      child: Obx(() => Text(controller.isQuizCompleted() ? "showResults".tr : "next".tr)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
