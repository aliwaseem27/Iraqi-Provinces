import 'package:Iraq/features/map/controllers/map_controller.dart';
import 'package:Iraq/features/map/models/country_model.dart';
import 'package:flutter/material.dart';

import 'country_clipper.dart';
import 'country_painter.dart';
import 'country_widget.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required this.country,
    required this.color,
  });

  final CountryModel country;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final controller = MapController.instance;
    return Stack(
      children: [
        CustomPaint(
          painter: BorderPainter(svgPath: country.path),
        ),
        ClipPath(
          clipper: CountryClipper(svgPath: country.path),
          child: CountryWidget(
            onTap: () => controller.updateCountry(country),
            color: color,
          ),
        ),
      ],
    );;
  }
}
