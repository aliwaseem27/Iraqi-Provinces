import 'package:Iraq/utils/constants/image_strings.dart';
import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedIndex = 0;

  final List<String> _imagePaths = [
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
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromRGBO(101, 107, 245, 1), width: 5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: InteractiveViewer(
                    minScale: 1,
                    maxScale: 4,
                    child: Image.asset(
                      _imagePaths[_selectedIndex],
                      key: ValueKey<int>(_selectedIndex),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: MSizes.spaceBetweenSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => _onButtonPressed(0),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedIndex == 0 ? const Color.fromRGBO(239, 241, 254, 1) : Colors.white,
                      side: BorderSide(
                        color: _selectedIndex == 0 ? const Color.fromRGBO(65, 76, 234, 1) : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Text("terrain".tr, style: const TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(width: MSizes.spaceBetweenSections),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => _onButtonPressed(1),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedIndex == 1 ? const Color.fromRGBO(239, 241, 254, 1) : Colors.white,
                      side: BorderSide(
                        color: _selectedIndex == 1 ? const Color.fromRGBO(65, 76, 234, 1) : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Text("rivers".tr, style: const TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(width: MSizes.spaceBetweenSections),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => _onButtonPressed(2),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedIndex == 2 ? const Color.fromRGBO(239, 241, 254, 1) : Colors.white,
                      side: BorderSide(
                        color: _selectedIndex == 2 ? const Color.fromRGBO(65, 76, 234, 1) : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Text("culturalSites".tr, style: const TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
