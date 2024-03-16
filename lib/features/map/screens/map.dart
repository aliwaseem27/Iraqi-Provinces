import 'package:Iraq/features/map/controllers/map_controller.dart';
import 'package:Iraq/features/map/models/country_model.dart';
import 'package:Iraq/features/map/screens/widgets/on_hover_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return Scaffold(
      body: Column(
        children: [
          FittedBox(
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
                                controller.buildCountry(
                                  country: country,
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
          ),
          SizedBox(height: 100),
          OnHoverButton(
            child: ElevatedButton(
              onPressed: () {},
              child: Text("WOOOW"),
            ),
          ),
        ],
      ),
    );
  }
}
