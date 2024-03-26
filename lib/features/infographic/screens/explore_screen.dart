import 'package:Iraq/utils/constants/image_strings.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore Maps"),
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
                  ElevatedButton(onPressed: (){}, child: const Text("LandMarks")),
                  const SizedBox(height: MSizes.spaceBetweenSections),
              
                  ElevatedButton(onPressed: (){}, child: const Text("Rivers")),
                  const SizedBox(height: MSizes.spaceBetweenSections),
              
                  ElevatedButton(onPressed: (){}, child: const Text("Airports")),
                  const SizedBox(height: MSizes.spaceBetweenSections),
              
                  ElevatedButton(onPressed: (){}, child: const Text("Cultural Sites")),
                  const SizedBox(height: MSizes.spaceBetweenSections),
              
                  ElevatedButton(onPressed: (){}, child: const Text("Weather")),
                  const SizedBox(height: MSizes.spaceBetweenSections),
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
