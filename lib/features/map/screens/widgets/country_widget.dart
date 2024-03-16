import 'package:flutter/material.dart';

class CountryWidget extends StatelessWidget {
  const CountryWidget({
    super.key,
    required this.onTap,
    required this.color,
  });

  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 5),
          color: color,
        ),
      ),
    );
  }
}
