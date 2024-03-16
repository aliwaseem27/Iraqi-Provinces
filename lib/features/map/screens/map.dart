import 'package:Iraq/features/map/controllers/map_loader.dart';
import 'package:Iraq/features/map/models/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/image_strings.dart';
import 'country_clipper.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  Widget _getClippedImage({
    required CountryModel country,
    required CountryClipper clipper,
  }) {
    return ClipPath(
      clipper: clipper,
      child: Container(
        color: Colors.teal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loader = Get.put(MapLoader());
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<CountryModel>>(
          future: loader.loadSvgImage(svgImage: MImages.iraqMapInlineStyling),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Stack(
                children: [
                  for (var country in snapshot.data!)
                    _getClippedImage(
                      country: country,
                      clipper: CountryClipper(svgPath: country.path),
                    )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
