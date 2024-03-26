import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("This app is made for", style: Theme.of(context).textTheme.displaySmall),
                Text("Iraqi Ministry of Education",style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("By Baghdad High School",style: Theme.of(context).textTheme.titleLarge),
                Text("Teacher Faten Salah Abd",style: Theme.of(context).textTheme.titleLarge),
                Text("Teacher Huda Hussein",style: Theme.of(context).textTheme.titleLarge),
              ],
            )
          ],
        ),
      ),
    );
  }
}
