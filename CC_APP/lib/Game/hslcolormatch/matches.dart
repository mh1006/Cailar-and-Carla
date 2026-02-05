import 'matchesModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'circle.dart';

class Matches_Easy extends StatelessWidget{
  static var matchHex;
  @override
  Widget build(BuildContext context) =>
      Consumer<MatchesModel_Easy>(
          builder: (context, matchesModel, _) {
            var color = HSLColor.fromAHSL(1,
              matchesModel.hue.toDouble(),
              matchesModel.sat,
              matchesModel.light,
            ).toColor();

            matchHex = color.value;
            return Column(
              children: <Widget>[
                Circle(color),
              ],
            );
          }
      );
}

class Matches_Normal extends StatelessWidget{
  static var matchHex;
  @override
  Widget build(BuildContext context) =>
      Consumer<MatchesModel_Normal>(
          builder: (context, matchesModel, _) {
            var color = HSLColor.fromAHSL(1,
              matchesModel.hue.toDouble(),
              matchesModel.sat,
              matchesModel.light,
            ).toColor();

            matchHex = color.value;

            return Column(
              children: <Widget>[
                Circle(color)
              ],
            );
          }
      );
}

class Matches_Hard extends StatelessWidget{
  static var matchHex;
  @override
  Widget build(BuildContext context) =>
      Consumer<MatchesModel_Hard>(
          builder: (context, matchesModel, _) {
        var color = HSLColor.fromAHSL(1,
            matchesModel.hue.toDouble(),
            matchesModel.sat,
            matchesModel.light,
        ).toColor();

        matchHex = color.value;

        return Column(
          children: <Widget>[
            Circle(color)
          ],
        );
        }
      );
}