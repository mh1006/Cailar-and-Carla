import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/color_adjust/colorid.dart';
import '../square.dart';
import 'colorset.dart';
import 'hslcircle.dart';

Color next;

class MyColor extends StatefulWidget {
  static ValueNotifier<int> newcolor = ValueNotifier(0);
  static double OH,OS,OL;

  @override
  _MyColorState createState() => _MyColorState();
}

class _MyColorState extends State<MyColor> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ValueListenableBuilder(
            valueListenable: MyColor.newcolor,
            builder: (BuildContext context, int newColor, Widget child) {
              next = Color(newColor);
              HSLColor hcolor = HSLColor.fromColor(next);
              MyColor.OH=hcolor.hue;
              MyColor.OS=hcolor.saturation;
              MyColor.OL=hcolor.lightness;
              var nowh = HSLColor.fromAHSL(1, hcolor.hue, 1, 0.5).toColor();
              var nows = HSLColor.fromAHSL(1, 0, 0, hcolor.saturation).toColor();
              var nowl = HSLColor.fromAHSL(1, 0, 0, hcolor.lightness).toColor();
              return Column(children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Square(next),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HSLCircle(nowh, 0),
                            HSLCircle(nows, 1),
                            HSLCircle(nowl, 2),
                          ]),
                    ]),
                Text(
                  ColorIdentify(next),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ]);
            }));
  }
}

class OfflineColor extends StatelessWidget {
  static var colorHex;
  static var color;
  static Color m_rgb;
  static double H,S,L;

  @override
  Widget build(BuildContext context) =>
      Consumer<HSLColorSet>(builder: (context, ColorSet, _) {
        color = HSLColor.fromAHSL(1, ColorSet.H, ColorSet.S, ColorSet.L);
        H=ColorSet.H;
        S=ColorSet.S;
        L=ColorSet.L;
        Color hslcolor = color.toColor();
        colorHex = hslcolor.value;
        var nowh = HSLColor.fromAHSL(1, ColorSet.H, 1, 0.5).toColor();
        var nows = HSLColor.fromAHSL(1, 0, 0, ColorSet.S).toColor();
        var nowl = HSLColor.fromAHSL(1, 0, 0, ColorSet.L).toColor();
        return Column(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Square(hslcolor),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              HSLCircle(nowh, 0),
              HSLCircle(nows, 1),
              HSLCircle(nowl, 2),
            ]),
          ]),
          Text(
            ColorIdentify(hslcolor),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ]);
      });
}
