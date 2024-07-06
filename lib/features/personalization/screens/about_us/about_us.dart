import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("aboutUs".tr),
      ),
      body: Container(
        padding: const EdgeInsets.all(MSizes.defaultSize),
        child: Row(
          children: [
            // Old About
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text("madeBy".tr, style: Theme.of(context).textTheme.titleLarge),
            //         Text("my_name".tr, style: Theme.of(context).textTheme.displayLarge),
            //         Text("karbala_education".tr, style: Theme.of(context).textTheme.displayMedium),
            //         Text("baghdad_high_school".tr, style: Theme.of(context).textTheme.displaySmall),
            //       ],
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text("by".tr, style: Theme.of(context).textTheme.titleMedium),
            //         Text("faten".tr, style: Theme.of(context).textTheme.titleLarge),
            //         Text("saja".tr, style: Theme.of(context).textTheme.titleLarge),
            //       ],
            //     )
            //   ],
            // ),

            // New About
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("madeBy".tr, style: Theme.of(context).textTheme.titleLarge),
                    Text("my_name".tr, style: Theme.of(context).textTheme.displayLarge),
                    Text("job_title".tr, style: Theme.of(context).textTheme.displayMedium),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("contact_me".tr, style: Theme.of(context).textTheme.titleMedium),
                    SelectableText("email_address".tr, style: Theme.of(context).textTheme.titleLarge),
                    SelectableText("linkedin_link".tr, style: Theme.of(context).textTheme.titleLarge),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
