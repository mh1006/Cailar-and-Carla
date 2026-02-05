import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'flutter_hsl/colorset.dart';


class HSLSliders extends StatelessWidget {
  Widget _bulidSlider(
          {String label, var color, double value, Function onChanged}) =>
      Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
        Container(
          width: phonewidth*0.6,
          child:Slider(
              activeColor: color,
              value: value,
              onChanged: onChanged,
              min: 0,
              max: 1,
            ),
        ), ],
        ),
      );

  Widget _bulidcircleSlider(
          {String label, var color, double value, Function onChanged}) =>
      Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              width: phonewidth*0.6,
            child:Slider(
              activeColor: color,
              value: value,
              onChanged: onChanged,
              min: 0,
              max: 360,
            ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    var color = Provider.of<HSLColorSet>(context, listen: true);
    return Column(
      children: <Widget>[
        _bulidcircleSlider(
          label: "H",
          color: HSLColor.fromAHSL(1, color.H, 1, 0.5).toColor(),
          value: color.H,
          onChanged: (value) => color.H = value,
        ),
        _bulidSlider(
          label: "S",
          color: HSLColor.fromAHSL(1, 0, 0, color.S).toColor(),
          value: color.S,
          onChanged: (value) => color.S = value,
        ),
        _bulidSlider(
          label: "L",
          color: HSLColor.fromAHSL(1, 0, 0, color.L).toColor(),
          value: color.L,
          onChanged: (value) => color.L = value,
        ),
      ],
    );
  }
}


class HueSliders extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var color = Provider.of<HSLColorSet>(context, listen: true);
    return SleekCircularSlider(
      min: 0,
      max: 360,
      initialValue: 0,
      onChange: (double value)  => color.H = value,
      onChangeStart: (double startValue) {
        // callback providing a starting value (when a pan gesture starts)
      },
      onChangeEnd: (double endValue) {
        // ucallback providing an ending value (when a pan gesture ends)
      },
      innerWidget: (double value) {
        // use your custom widget inside the slider (gets a slider value from the callback)
      },
    );
  }

  }
