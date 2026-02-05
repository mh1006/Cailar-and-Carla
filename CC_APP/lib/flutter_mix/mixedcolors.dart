import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:clippy_flutter/paralellogram.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'colormodel.dart';

class R1Color extends StatelessWidget {
  static Color r1_rgb;

  @override
  Widget build(BuildContext context) {
    var r1c = Provider.of<R1ColorModel>(context, listen: true);
    r1_rgb = r1c.r1_color;
    return Container(
      width: 100,
      height: 175,
      child: Parallelogram(
        cutLength: 40,
        edge: Edge.TOP,
        child: Container(
          color: r1c.r1_color,
        ),
      ),
    );
  }
}

class R1control extends StatelessWidget {
  Widget build(BuildContext context) {
    var r1c = Provider.of<R1ColorModel>(context, listen: true);
    void resetr1() {
      r1c.r1_reset();
    }

    return RaisedButton(
        child: Icon(
          Icons.arrow_left,
          color: Colors.white,
        ),
        color: Color.fromRGBO(255, 226, 128, 1),
        onPressed: () {
          resetr1();
        });
  }
}

class R2Color extends StatelessWidget {
  static Color r2_rgb;

  @override
  Widget build(BuildContext context) {
    var r2c = Provider.of<R2ColorModel>(context, listen: true);
    r2_rgb = r2c.r2_color;
    return Container(
      width: 100,
      height: 175,
      child: Parallelogram(
        cutLength: 40,
        edge: Edge.BOTTOM,
        child: Container(
          color: r2c.r2_color,
        ),
      ),
    );
  }
}

class R2control extends StatelessWidget {
  Widget build(BuildContext context) {
    var r2c = Provider.of<R2ColorModel>(context, listen: true);
    void resetr2() {
      r2c.r2_reset();
    }

    return RaisedButton(
        child: Icon(
          Icons.arrow_right,
          color: Colors.white,
        ),
        color: Color.fromRGBO(255, 226, 128, 1),
        onPressed: () {
          resetr2();
        });
  }
}

class RMixedColor extends StatelessWidget {
  static Color rmix_rgb;

  Widget build(BuildContext context) {
    var R1 = Provider.of<R1ColorModel>(context, listen: true);
    var R2 = Provider.of<R2ColorModel>(context, listen: true);
    var R1color = R1.r1_color;
    var R2color = R2.r2_color;
    var MixR = (R1color.red + R2color.red) ~/ 2;
    var MixG = (R1color.green + R2color.green) ~/ 2;
    var MixB = (R1color.blue + R2color.blue) ~/ 2;
    rmix_rgb = Color.fromRGBO(MixR, MixG, MixB, 1);
    return Rhombus(
        child: Container(
      width: 200,
      height: 88,
      alignment: Alignment.center,
      color: rmix_rgb,
    ));
  }
}
