import 'dart:math';

import 'package:flutter/material.dart';

import '/flutter_color/flutter_hsl/hslcolorsquare.dart';
import '/flutter_mix/valuelisten.dart';

Color fix;
int clear;

Fix(Color color) {
  var rg = max(color.red, color.green) / min(color.red, color.green);
  var br = color.blue / color.red;
  var bp = color.blue / (color.blue + color.green + color.red);
  HSLColor Hcolor = HSLColor.fromColor(color);
  var hue = Hcolor.hue;
  var sat = Hcolor.saturation;
  var light = Hcolor.lightness;
//調整彩度
  sat = sat + 0.1;
  print(clear);
  //紅色
  if(color.red>color.green&&color.red>color.blue&&clear<=10000){
    sat = sat + 0.1;
  }
  //黃色
  if (rg < 1.5 && rg >= 1 && bp < 0.25 && clear >=35000) {
    print("yf");
    if(color.red>color.green&&rg>1.45){
      print(rg);
      hue = 55;
    }
    else if(color.red<color.green&&rg>1.45){
      print(rg);
      hue = 65;
    }
    else{
      print(rg);
      hue=60;
    }
    if(clear>50000){
      sat = sat * 2.5;
      light= light * 2.5;
    }
    else {
      sat = sat * 2.5;
      light = light * 2;
    }
  }
  //橘色
  else if(hue>=25&&hue<=60&&clear>10000&&clear<=35000){
    print("of");
    print(clear);
    if(clear>30000) {
      sat = sat * 2.5;
      light = light * 2.25;
    }
    else{
      sat = sat * 1.75;
      light = light * 1.75;
    }
  }
  //紫色
  else if (color.green<color.blue&&br < 3.5 && br >= 1 && clear <=10000 && clear>2500) {
    print("pf");
    print(br);
    hue += 60;
    if(clear<=7000) {
      sat = sat - 0.2;
      light = light - 0.1;
    }
    else{
      sat = sat*1.25;
      light = light*1.5;
    }
  }
//調整亮度

  else if (clear >= 40000) {
    light = 1;
  } else if (clear >= 35000) {
    light = light * 2.5;
  }else if (clear >= 30000) {
    light = light * 2.25;}
  else if (clear >= 15000) {
    light = light * 1.75;
  }else if (clear >= 12000) {
    light = light * 1.5;
  } else if (clear < 5000) {
    light = 0;
  }

  //校正
  if (light > 1) {
    light = 1;
  }
  if (sat > 1) {
    sat = 1;
  }
  Hcolor = HSLColor.fromAHSL(1, hue, sat, light);
  fix = Hcolor.toColor();
  print(color);
  print(Hcolor.toColor());
  Cube.nextcolor.value = fix.value;
  MyColor.newcolor.value = fix.value;
  return fix;
}
