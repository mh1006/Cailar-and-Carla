import '/flutter_color/flutter_hsl/hslcircle.dart';
import 'package:flutter/material.dart';
import 'uniquecolorgenerator.dart';
import 'matchesModel.dart';
import 'package:provider/provider.dart';

class Sliders_Easy extends StatelessWidget {
  Widget _bulidSlider(
      {String label, var color, double value, Function onChanged}) =>
      Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
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
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
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
  Widget build(BuildContext context){
    var color= Provider.of<MatchesModel_Easy>(context, listen: true);
    return Column(
      children: <Widget>[
        _bulidcircleSlider(
          label: "H : ${color.hue.toInt()}º",
          color: HSLColor.fromAHSL(1, color.hue, 1, 0.5).toColor(),
          value: color.hue,
          onChanged: (value) => color.hue = value,
        ),
        Text(
          "S=${(UniqueColorGenerator.targetcolor[1]*100).toInt()}%",
          style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        HSLCircle(HSLColor.fromAHSL(1, 0, 0, UniqueColorGenerator.targetcolor[1]).toColor(),1),
        Text("L=${(UniqueColorGenerator.targetcolor[2]*100).toInt()}%",
          style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        HSLCircle(HSLColor.fromAHSL(1, 0, 0, UniqueColorGenerator.targetcolor[2]).toColor(),2),
      ],
    );
  }
}

class Sliders_Normal extends StatelessWidget {
  Widget _bulidSlider(
      {String label, var color, double value, Function onChanged}) =>
      Padding(
        padding: EdgeInsets.only(top: 10),
        child:Column(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
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
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
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
  Widget build(BuildContext context){
    var color= Provider.of<MatchesModel_Normal>(context, listen: true);
    return Column(
      children: <Widget>[
        _bulidcircleSlider(
          label: "H : ${color.hue.toInt()}º",
          color: HSLColor.fromAHSL(1, color.hue, 1, 0.5).toColor(),
          value: color.hue,
          onChanged: (value) => color.hue = value,
        ),
        _bulidSlider(
          label: "S: ${(color.sat*100).toInt()}%",
          color: HSLColor.fromAHSL(1, 0, 0, color.sat).toColor(),
          value: color.sat,
          onChanged: (value) => color.sat = value,
        ),
        Text("L=${(UniqueColorGenerator.targetcolor[2]*100).toInt()}%",
          style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        HSLCircle(HSLColor.fromAHSL(1, 0, 0, UniqueColorGenerator.targetcolor[2]).toColor(),2),
      ],
    );
  }
}


class Sliders_Hard extends StatelessWidget {
  Widget _bulidSlider(
      {String label, var color, double value, Function onChanged}) =>
      Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
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
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
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
  Widget build(BuildContext context){
    var color= Provider.of<MatchesModel_Hard>(context, listen: true);
    return Column(
      children: <Widget>[
        _bulidcircleSlider(
          label: "H : ${color.hue.toInt()}º",
          color: HSLColor.fromAHSL(1, color.hue, 1, 0.5).toColor(),
          value: color.hue,
          onChanged: (value) => color.hue = value,
        ),
        _bulidSlider(
          label: "S: ${(color.sat*100).toInt()}%",
          color: HSLColor.fromAHSL(1, 0, 0, color.sat).toColor(),
          value: color.sat,
          onChanged: (value) => color.sat = value,
        ),
        _bulidSlider(
          label: "L: ${(color.light*100).toInt()}%",
          color: HSLColor.fromAHSL(1, 0, 0, color.light).toColor(),
          value:  color.light,
          onChanged: (value) =>  color.light = value,
        ),
      ],
    );
  }
}
