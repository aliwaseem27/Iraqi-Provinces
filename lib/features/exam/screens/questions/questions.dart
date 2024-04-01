import 'package:Iraq/features/exam/controllers/exam_controller.dart';
import 'package:Iraq/features/exam/screens/results/results.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

List<String> options = ["Option 1", "Option 2", "Option 3"];

class _QuestionsScreenState extends State<QuestionsScreen> {
  String currentOption = options[0];

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
                    Text(
                      "40%",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    LinearProgressIndicator(
                      value: 0.4,
                      minHeight: 12,
                      borderRadius: BorderRadius.circular(12),
                    ),
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
                  return ListTile(
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
                    // ElevatedButton(
                    //   onPressed: () => Get.to(() => const ResultsScreen()),
                    //   child: const Text("Next Question"),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        if (!controller.isQuizCompleted()) {
                          controller.nextQuestion();
                        } else {
                          // Show results or reset the quiz
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Quiz Completed"),
                              content: Obx(() => Text("Your score is: ${controller.score}")),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    controller.resetQuiz();
                                    Navigator.of(context).pop(); // Close the dialog
                                  },
                                  child: Text('Restart'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: Obx(() => Text(controller.isQuizCompleted() ? "Show Results" : "Next")),
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
