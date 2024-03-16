import 'package:Iraq/data/repositories/map_repository.dart';
import 'package:Iraq/features/map/screens/widgets/country_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_strings.dart';
import '../models/country_model.dart';
import '../screens/widgets/country_clipper.dart';

class MapController extends GetxController {
  static MapController get instance => Get.find();

  final MapRepository mapRepository = Get.put(MapRepository());

  final pressedCountry = CountryModel.empty().obs;

  Future<List<CountryModel>> loadMap() async {
    return await mapRepository.loadSvgImage(svgImage: MImages.iraqMapInlineStyling);
  }

  Future<void> updateCountry(CountryModel country) async {
    pressedCountry.value = country;
  }

  Widget buildCountry({
    required CountryModel country,
    required CountryClipper clipper,
    required Color color,
  }) {
    return ClipPath(
      clipper: clipper,
      child: CountryWidget(
        onTap: () => updateCountry(country),
        color: color,
      ),
    );
  }
}
