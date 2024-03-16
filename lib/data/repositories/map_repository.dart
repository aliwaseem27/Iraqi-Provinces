import 'package:Iraq/features/map/models/country_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xml/xml.dart';

class MapRepository extends GetxController {
  static MapRepository get instance => Get.find();

   Future<List<CountryModel>> loadSvgImage({required String svgImage}) async {
    List<CountryModel> maps = [];

    String generalString = await rootBundle.loadString(svgImage);

    XmlDocument document = XmlDocument.parse(generalString);

    final paths = document.findAllElements("path");

    for (var element in paths) {
      String partD = element.getAttribute("d").toString();
      String partStyle = element.getAttribute("style").toString();
      String partColor = element.getAttribute("color").toString();
      String partName = element.getAttribute("name").toString();

      maps.add(CountryModel(path: partD, style: partStyle, color: partColor, name: partName));
    }

    return maps;
  }
}
