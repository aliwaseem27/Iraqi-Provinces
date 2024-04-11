import 'package:Iraq/utils/constants/image_strings.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedIndex = 0;

  List<String> _imagePaths = [
    MImages.terrainMap,
    MImages.riversMap,
    MImages.culturalMap,
  ];

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("exploreMapsTitle".tr),
      ),
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Column(
          children: [

            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Image.asset(
                  _imagePaths[_selectedIndex],
                  key: ValueKey<int>(_selectedIndex),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: MSizes.spaceBetweenSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: () => _onButtonPressed(0), child: Text("terrain".tr)),
                const SizedBox(width: MSizes.spaceBetweenSections),
                ElevatedButton(onPressed: ()=> _onButtonPressed(1), child: Text("rivers".tr)),
                const SizedBox(width: MSizes.spaceBetweenSections),
                ElevatedButton(onPressed: () => _onButtonPressed(2), child: Text("culturalSites".tr)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
