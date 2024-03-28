import 'package:get/get.dart';

import 'ar.dart';
import 'en.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": en,
        "ar_IQ": ar,
      };
}
