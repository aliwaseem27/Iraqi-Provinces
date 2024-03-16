import 'package:Iraq/data/repositories/map_repository.dart';
import 'package:Iraq/features/map/controllers/map_controller.dart';
import 'package:Iraq/features/map/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/image_strings.dart';
import 'widgets/country_clipper.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 5)),
        width: 500,
        height: 500,
        child: Center(
          child: FutureBuilder<List<CountryModel>>(
            future: controller.loadMap(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return InteractiveViewer(
                  maxScale: 3,
                  minScale: 0.1,
                  child: Obx(
                    () => Stack(
                      children: [
                        for (var country in snapshot.data!)
                          controller.buildCountry(
                            country: country,
                            clipper: CountryClipper(svgPath: country.path),
                            color: Color(int.parse("FF${country.color}", radix: 16))
                                .withOpacity(controller.pressedCountry.value.name == ""
                                    ? 1.0
                                    : controller.pressedCountry.value.name == country.name
                                        ? 1.0
                                        : 0.4),
                          )
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
