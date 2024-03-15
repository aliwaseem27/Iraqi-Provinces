import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class CountryClipper extends CustomClipper<Path> {
  CountryClipper({
    required this.svgPath,
  });


  String svgPath;


  @override
  Path getClip(Size size) {
    var path = parseSvgPathData(svgPath);
    // final Matrix4 matrix4 = Matrix4.identity();
    //
    //
    // matrix4.scale(1.1, 1.1);
    //
    //
    // return path.transform(matrix4.storage);
    return path;
  }


  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}