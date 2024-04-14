import 'package:Iraq/features/exam/controllers/exam_controller.dart';
import 'package:Iraq/features/personalization/screens/main_menu/main_menu_screen.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ExamController.instance;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("quizResults".tr),
      // ),
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Score tag
            Column(
              children: [
                Text("yourScore".tr, style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(height: MSizes.spaceBetweenSections),
                Container(
                  padding: const EdgeInsets.all(MSizes.spaceBetweenSections),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromRGBO(101, 107, 245, 1), width: 10),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${(controller.score / controller.questions.length * 100).toInt()}%",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: const Color.fromRGBO(101, 107, 245, 1),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),

            // Incorrect Questions
            if (controller.wrongAnswers.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "wrongAnswers".tr,
                      ),
                      const SizedBox(height: MSizes.spaceBetweenSections),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - (MSizes.defaultSize * 2 + 1),
                        height: 300,
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.wrongAnswers.length,
                            itemBuilder: (context, index) {
                              final wrongAnswer = controller.wrongAnswers[index];
                              return ListTile(
                                // tileColor: index % 2 == 0 ? Colors.grey.shade100 : Colors.white,
                                title: Text(
                                  controller.questions[wrongAnswer].question,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  controller.questions[wrongAnswer]
                                      .options[controller.questions[wrongAnswer].correctAnswerIndex],
                                  style: const TextStyle(color: Colors.green),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            // Finish Button
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => Get.offAll(() => const MainMenuScreen()),
                      child: Text("finish".tr),
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
