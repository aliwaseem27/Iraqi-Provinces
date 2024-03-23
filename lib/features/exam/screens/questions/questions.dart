import 'package:Iraq/features/exam/screens/results/results.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    SizedBox(height: MSizes.spaceBetweenSections * 2),
                  ],
                ),

                // Question Title
                Text("Q/ Which province is the most producer of oil?", style: Theme.of(context).textTheme.displaySmall),
                SizedBox(height: MSizes.spaceBetweenSections * 2),
              ],
            ),

            // Choices
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Baghdad'),
                  leading: Radio(
                    value: options[0],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Basra'),
                  leading: Radio(
                    value: options[1],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Karkuk'),
                  leading: Radio(
                    value: options[2],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value!;
                      });
                    },
                  ),
                ),
              ],
            ),

            // Next Button
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => Get.to(() => const ResultsScreen()),
                      child: Text("Next Question"),
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
