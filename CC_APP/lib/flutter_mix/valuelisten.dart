import 'package:clippy_flutter/paralellogram.dart';
import 'package:clippy_flutter/rhombus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colormixpage.dart';

Color mix_rgb = Color(0xff90c097);

class Cube extends StatefulWidget {
  static ValueNotifier<int> nextcolor = ValueNotifier(0);
  static ValueNotifier<int> mixcolor = ValueNotifier(0xff90c097);
  static List<Color> mycolor = [Colors.yellow, Colors.blue];

  @override
  _CubeState createState() => _CubeState();
}

class _CubeState extends State<Cube> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: MediaQuery.of(context).size.height * 0.40,
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(4.0),
            child: ValueListenableBuilder(
                valueListenable: Cube.nextcolor,
                builder: (BuildContext context, int newColor, Widget child) {
                  Color mine = Color(newColor);
                  if (leftnright == 0) {
                    Cube.mycolor[0] = mine;
                    Mix(Cube.mycolor[0], Cube.mycolor[1]);
                  } else if (leftnright == 1) {
                    Cube.mycolor[1] = mine;
                    Mix(Cube.mycolor[0], Cube.mycolor[1]);
                  }
                  ;

                  return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 100,
                            height: 175,
                            child: Parallelogram(
                                cutLength: 40,
                                edge: Edge.TOP,
                                child: Container(color: Cube.mycolor[0]))),
                        Container(
                            width: 100,
                            height: 175,
                            child: Parallelogram(
                                cutLength: 40,
                                edge: Edge.BOTTOM,
                                child: Container(color: Cube.mycolor[1])))
                      ]);
                })),
      ),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          child: Container(
              width: MediaQuery.of(context).size.width,
              child:  ValueListenableBuilder(
                      valueListenable: Cube.mixcolor,
                      builder:
                          (BuildContext context, int mixColor, Widget child) {
                        return Center(
                            child: Rhombus(
                                child: Container(
                                    width: 200,
                                    height: 88,
                                    alignment: Alignment.center,
                                    color: Color(mixColor))));
                      })
    ))]);
  }

  Mix(Color C1, Color C2) {
    var MixR = (C1.red + C2.red) ~/ 2;
    var MixG = (C1.green + C2.green) ~/ 2;
    var MixB = (C1.blue + C2.blue) ~/ 2;
    mix_rgb = Color.fromRGBO(MixR, MixG, MixB, 1);
    Cube.mixcolor.value = mix_rgb.value;
  }
}
