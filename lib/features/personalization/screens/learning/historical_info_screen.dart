import 'package:Iraq/utils/constants/sizes.dart';
import 'package:Iraq/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoricalInfoScreen extends StatelessWidget {
  const HistoricalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(MSizes.defaultSize),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text("Baghdad", style: Theme.of(context).textTheme.displayMedium),
                    SizedBox(
                      child: Text(MTexts.paragraph),
                    ),
                  ],
                ),
              ),
              SizedBox(width: MSizes.spaceBetweenSections),
              Expanded(
                child: Column(
                  children: [
                    Text("Baghdad", style: Theme.of(context).textTheme.displayMedium),
                    SizedBox(
                      child: Text(MTexts.paragraph),
                    ),
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
