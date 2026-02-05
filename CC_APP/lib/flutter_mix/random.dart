import 'dart:math';

import 'package:flutter/material.dart';

class RandomColor {
  static Random random = Random();

  static Color getvalue() {
    return Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
  }
}
