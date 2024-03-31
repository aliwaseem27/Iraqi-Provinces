import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class BorderPainter extends CustomPainter {
  BorderPainter({
    super.repaint,
    required this.svgPath,
  });

  final String svgPath;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey // Border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0; // Border width

    var path = parseSvgPathData(svgPath);

    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(0.8, 0.8);
    path = path.transform(matrix4.storage).shift(const Offset(-80, 0));

    // For Painting text on the canvas, but it has a problem which is painting on the same spot for all texts.
    // if (name != ""){
    //   TextSpan span = TextSpan(
    //       style: const TextStyle(color: Colors.black),
    //       text: name);
    //   TextPainter tp = TextPainter(
    //     text: span,
    //     textAlign: TextAlign.center,
    //     textDirection: TextDirection.ltr,
    //   );
    //   tp.layout();
    //   tp.paint(canvas, const Offset(0, 0));
    // }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
