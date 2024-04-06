import 'dart:convert';

import 'package:Iraq/features/exam/models/mcq.dart';
import 'package:Iraq/localization/language_controller.dart';
import 'package:Iraq/utils/constants/assets_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExamRepository extends GetxController {
  static ExamRepository get instance => Get.find();

  final List<MCQ> _questions = <MCQ>[];

  @override
  void onInit() {
    super.onInit();
    readJsonFile();
    LanguageController.instance.currentLanguage.listen((_) {
      readJsonFile();
    });
  }

  Future<void> readJsonFile() async {
    try {
      final jsonFile =
          LanguageController.instance.currentLanguage.value == "ar_IQ" ? MAssetsString.mcq_ar : MAssetsString.mcq_en;
      final fileContent = await rootBundle.loadString(jsonFile);
      final List<dynamic> jsonData = json.decode(fileContent);
      questions.assignAll(jsonData.map((jsonItem) => MCQ.fromJson(jsonItem)).toList());
    } catch (e) {
      if (kDebugMode) {
        print("Error reading Json file: $e");
      }
    }
  }

  List<MCQ> get questions => _questions;
}
