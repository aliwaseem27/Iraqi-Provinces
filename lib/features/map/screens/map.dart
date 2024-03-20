import 'package:Iraq/features/map/controllers/map_controller.dart';
import 'package:Iraq/features/map/models/country_model.dart';
import 'package:Iraq/features/map/screens/widgets/map_widget.dart';
import 'package:Iraq/features/map/screens/widgets/on_hover_button.dart';
import 'package:Iraq/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InteractiveMap extends StatelessWidget {
  const InteractiveMap({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return FittedBox(
        child: Container(
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
                            MapWidget(
                              country: country,
                              color: controller.pressedCountry.value.name == ""
                                  ? MHelperFunctions.colorFromRGB(country.color)
                                  : controller.pressedCountry.value.name == country.name
                                      ? MHelperFunctions.increaseSaturation(country.color,increaseBy: 1)
                                      : MHelperFunctions.colorFromRGB(country.color).withAlpha(30),
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
