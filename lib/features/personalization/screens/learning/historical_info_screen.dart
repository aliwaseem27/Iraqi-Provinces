import 'package:Iraq/utils/constants/image_strings.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:Iraq/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class HistoricalInfoScreen extends StatelessWidget {
  const HistoricalInfoScreen({super.key});

  Future<String> loadMarkdownAsset() async {
    return await rootBundle.loadString('assets/articles/babil.md');
  }

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
                    // Text("Baghdad".tr, style: Theme.of(context).textTheme.displayMedium),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      // width: 300,
                      child: FutureBuilder(
                        future: loadMarkdownAsset(),
                        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            return Markdown(
                              data: snapshot.data!,
                              styleSheet: MarkdownStyleSheet(
                                textScaler: TextScaler.linear(1.2),
                                // p: TextStyle(fontSize: 16.0), // For normal text paragraphs
                                // h1: TextStyle(fontSize: 42.0), // For h1 headers
                                // h2: TextStyle(fontSize: 28.0), // For h2 headers
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error loading Markdown');
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
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
