import 'package:flutter/material.dart';

abstract class Mark {
  void draw(Canvas canvas, int index, double dividedSize);
}