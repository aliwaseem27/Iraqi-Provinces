import 'package:Iraq/data/repositories/map_repository.dart';
import 'package:Iraq/utils/constants/enums.dart';

import 'package:get/get.dart';

import '../../../utils/constants/image_strings.dart';
import '../models/country_model.dart';

class MapController extends GetxController {
  static MapController get instance => Get.find();

  final MapRepository mapRepository = Get.put(MapRepository());

  final pressedCountry = CountryModel.empty().obs;
  final selectedProvince = Province.empty.obs;
  final List<CountryModel> countries = <CountryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMap().then((loadedCountries) {
      countries.assignAll(loadedCountries);
    });
  }

  Future<List<CountryModel>> loadMap() async {
    return await mapRepository.loadSvgImage(svgImage: MImages.iraqMapInlineStyling);
  }

  Future<void> updateCountry(CountryModel country) async {
    pressedCountry.value = country;
    updateProvinceFromMap();
  }

  Future<void> updateProvinceFromMap() async {
    selectedProvince.value = Province.fromString(pressedCountry.value.name);
  }

  Future<void> updateProvinceByButton(Province province) async {
    selectedProvince.value = province;
    final country = countries.firstWhere((countryModel) => countryModel.name == province.title);
    updateCountry(country);
  }
}
