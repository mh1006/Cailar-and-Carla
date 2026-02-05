import 'dart:math';
import 'package:flutter/material.dart';


class UniqueColorGenerator{
  static Random random = Random();
  static List<double> targetcolor = new List<double>();
  static Color getColor() {
    targetcolor.clear();
    double h = random.nextInt(360).toDouble();
    double s = random.nextDouble();
    double l = random.nextDouble();
    while(s<=0.2){
        s = random.nextDouble();
      }
      while(l<=0.25||l>=0.9){
      l = random.nextDouble();
    }
    targetcolor.add(h);
    targetcolor.add(s);
    targetcolor.add(l);

    return HSLColor.fromAHSL(1, h, s, l).toColor();
  }
}