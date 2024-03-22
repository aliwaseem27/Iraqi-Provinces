import 'package:Iraq/utils/constants/image_strings.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Maps"),
      ),
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(onPressed: (){}, child: Text("LandMarks")),
                  SizedBox(height: MSizes.spaceBetweenSections),
              
                  ElevatedButton(onPressed: (){}, child: Text("Rivers")),
                  SizedBox(height: MSizes.spaceBetweenSections),
              
                  ElevatedButton(onPressed: (){}, child: Text("Airports")),
                  SizedBox(height: MSizes.spaceBetweenSections),
              
                  ElevatedButton(onPressed: (){}, child: Text("Cultural Sites")),
                  SizedBox(height: MSizes.spaceBetweenSections),
              
                  ElevatedButton(onPressed: (){}, child: Text("Weather")),
                  SizedBox(height: MSizes.spaceBetweenSections),
                ],
              ),
            ),
            Expanded(child: SvgPicture.asset(MImages.iraqMap)),
          ],
        ),
      ),
    );
  }
}
