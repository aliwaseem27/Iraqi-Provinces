import 'package:Iraq/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PurpleBackgroundContainer extends StatelessWidget {
  const PurpleBackgroundContainer({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromRGBO(110, 143, 248, 1),
            Color.fromRGBO(101, 107, 245, 1),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -50,
            bottom: -180,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.white.withOpacity(0.05),
                    Colors.white.withOpacity(0.2),
                  ],
                ),
              ),
              width: 300,
              height: 300,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(MSizes.spaceBetweenSections),
            child: child,
          ),
        ],
      ),
    );
  }
}