import 'package:Iraq/features/map/controllers/map_loader.dart';
import 'package:Iraq/features/map/models/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/image_strings.dart';
import 'country_clipper.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Widget _buildCountry({
    required CountryModel country,
    required CountryClipper clipper,
    required Color color,
  }) {
    return ClipPath(
      clipper: clipper,
      child: GestureDetector(
        onTap: ()=> _onCountrySelected(country),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 5),color: color),
        ),
      ),
    );
  }

  CountryModel? _pressedCountry;

  _onCountrySelected(CountryModel country){
    setState(() {
      _pressedCountry = country;
    });


  }

  @override
  Widget build(BuildContext context) {
    final loader = Get.put(MapLoader());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 5)),
        width: 500,
        height: 500,
        child: Center(
          child: FutureBuilder<List<CountryModel>>(
            future: loader.loadSvgImage(svgImage: MImages.iraqMapInlineStyling),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return InteractiveViewer(
                  maxScale: 3,
                  minScale: 0.1,
                  child: Stack(
                    children: [
                      for (var country in snapshot.data!)
                        _buildCountry(
                          country: country,
                          clipper: CountryClipper(svgPath: country.path),
                          color:  Color(int.parse("FF${country.color}", radix: 16)).withOpacity(
                              _pressedCountry == null ? 1.0 : _pressedCountry?.name == country.name ? 1.0 : 0.4),

                        )
                    ],
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
