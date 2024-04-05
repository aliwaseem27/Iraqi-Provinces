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
      appBar: AppBar(
        title: const Text("Your Results"),
      ),
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Score tag
            Column(
              children: [
                Text("Your Score", style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(height: MSizes.spaceBetweenSections),
                CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.teal,
                  child: Text("${controller.score/controller.questions.length * 100}%", style: Theme.of(context).textTheme.displaySmall),
                ),
              ],
            ),

            // Incorrect Questions
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You didn't get the following questions right:",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    Text(
                      "Q/ Which province is the most producer of oil?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Answer/ Basra",
                      style: TextStyle(color: Colors.green),
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
                      child: const Text("Finish"),
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
