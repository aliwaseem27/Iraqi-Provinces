import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  static LanguageController get instance => Get.find();

  final textDirection = TextDirection.rtl.obs;

  final currentLanguage = "ar_IQ".obs;

  chooseArabic() {
    Get.updateLocale(const Locale("ar_IQ"));
    currentLanguage.value = "ar_IQ";
    textDirection.value = TextDirection.rtl;
  }

  chooseEnglish() {
    Get.updateLocale(const Locale("en_US"));
    currentLanguage.value = "en_US";
    textDirection.value = TextDirection.ltr;
  }
}
