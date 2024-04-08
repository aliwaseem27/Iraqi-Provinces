import 'package:Iraq/features/map/controllers/map_controller.dart';
import 'package:Iraq/localization/language_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HistoricalInfoController extends GetxController{
  static  HistoricalInfoController get instance => Get.find();

  final mapController = MapController.instance;
  final languageController = LanguageController.instance;

  Future<String> loadMarkdownAsset() async {
    if (languageController.currentLanguage.value == "ar_IQ"){
      return await rootBundle.loadString('assets/articles/ar/${mapController.selectedProvince.value.name}.md');
    } else {
      return await rootBundle.loadString('assets/articles/en/${mapController.selectedProvince.value.name}.md');
    }
  }
}