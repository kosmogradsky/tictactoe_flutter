import 'package:flutter/material.dart';

import 'stroke_width.dart';
import 'mark.dart';

class NoughtMark implements Mark {
  @override
  void draw(Canvas canvas, int index, double dividedSize) {
    final redThickPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = doubleStrokeWidth
      ..color = Colors.red;

    double left = (index % 3) * dividedSize + doubleStrokeWidth * 2;
    double top = (index ~/ 3) * dividedSize + doubleStrokeWidth * 2;
    double noughtSize = dividedSize - doubleStrokeWidth * 4;

    canvas.drawOval(
        Rect.fromLTWH(left, top, noughtSize, noughtSize), redThickPaint);
  }
}
