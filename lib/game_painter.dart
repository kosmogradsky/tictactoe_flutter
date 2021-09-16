import 'package:flutter/material.dart';
import 'package:tictactoe_flutter/mark.dart';

import 'stroke_width.dart';

class GamePainter extends CustomPainter {
  Map<int, Mark> _gameMarks;

  GamePainter(this._gameMarks);

  @override
  void paint(Canvas canvas, Size size) {
    final blackPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Colors.black;

    final blackThickPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = doubleStrokeWidth
      ..color = Colors.black;

    final orangeThickPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = doubleStrokeWidth
      ..color = Colors.orange;

    final _dividedSize = size.width / 3.0;

    canvas.drawLine(
        Offset(strokeWidth, _dividedSize - halfStrokeWidth),
        Offset(size.width - strokeWidth, _dividedSize - halfStrokeWidth),
        blackPaint);

    canvas.drawLine(
        Offset(strokeWidth, _dividedSize * 2 - halfStrokeWidth),
        Offset(size.width - strokeWidth, _dividedSize * 2 - halfStrokeWidth),
        blackPaint);

    canvas.drawLine(
        Offset(_dividedSize - halfStrokeWidth, strokeWidth),
        Offset(_dividedSize - halfStrokeWidth, size.height - strokeWidth),
        blackPaint);

    canvas.drawLine(
        Offset(_dividedSize * 2 - halfStrokeWidth, strokeWidth),
        Offset(_dividedSize * 2 - halfStrokeWidth, size.height - strokeWidth),
        blackPaint);

    _gameMarks.forEach((index, mark) {
      mark.draw(canvas, index, _dividedSize);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
