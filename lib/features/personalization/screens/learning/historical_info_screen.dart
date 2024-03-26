import 'package:Iraq/utils/constants/image_strings.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:Iraq/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class HistoricalInfoScreen extends StatelessWidget {
  const HistoricalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historical Info about (Name)"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(MSizes.defaultSize),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text("Baghdad", style: Theme.of(context).textTheme.displayMedium),
                    const SizedBox(
                      child: Text(MTexts.paragraph),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: MSizes.spaceBetweenSections),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(MImages.historical_baghdad),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
