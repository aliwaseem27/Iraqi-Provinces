import 'package:Iraq/features/map/controllers/map_controller.dart';
import 'package:Iraq/features/map/screens/widgets/map_widget.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:Iraq/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InteractiveMap extends StatelessWidget {
  const InteractiveMap({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MapController.instance;
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(101, 107, 245,1), width: 5),
              borderRadius: BorderRadius.circular(20),
            ),
            width: 500,
            height: 500,
            child: Center(
              child: InteractiveViewer(
                maxScale: 3,
                minScale: 1,
                transformationController: controller.transformationController,
                child: Obx(
                  () => Stack(
                    children: [
                      for (var country in controller.countries)
                        MapWidget(
                          country: country,
                          color: controller.pressedCountry.value.name == ""
                              ? MHelperFunctions.colorFromRGB(country.color)
                              : controller.pressedCountry.value.name == country.name
                                  ? MHelperFunctions.increaseSaturation(country.color, increaseBy: 1)
                                  : MHelperFunctions.colorFromRGB(country.color).withAlpha(30),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MSizes.spaceBetweenSections / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                  ),
                  onPressed: () => controller.zoomOut(),
                  child: Icon(Icons.remove),
                ),
              ),
              SizedBox(width: MSizes.spaceBetweenSections / 2),
              SizedBox(
                width: 24,
                height: 24,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                  ),
                  onPressed: () => controller.zoomIn(),
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
