import 'package:flutter/material.dart';
import 'match_difficulty.dart';
import 'matchesModel.dart';
import 'previewModel.dart';
import 'package:provider/provider.dart';

import '../gamepage.dart';
import 'match_main.dart';

class Reset_Easy extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var colorPreview = Provider.of<PreviewModel_Easy>(context, listen: true);
    var colorMatch = Provider.of<MatchesModel_Easy>(context, listen: true);

    void matchesReset() {
      matching= HSLColor.fromColor(Color(colorPreview.colorsPreview.value));
      colorMatch.hue = 0;
      colorMatch.sat = matching.saturation;
      colorMatch.light = matching.lightness;
    }

    void colorPreviewReset() {
      colorPreview.reset();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        color: Color.fromARGB(255, 254, 228, 172),
        child: Text(
          '再玩一次',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          colorPreviewReset();
          matchesReset();
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => Match_Easy(),
          maintainState: false,
          )
          );
        },
      ),
    );
  }
}
class Reset_Normal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var colorPreview = Provider.of<PreviewModel_Normal>(context, listen: true);
    var colorMatch = Provider.of<MatchesModel_Normal>(context, listen: true);
    void colorPreviewReset() {
      colorPreview.reset();
    }

    void matchesReset() {
      matching= HSLColor.fromColor(Color(colorPreview.colorsPreview.value));
      colorMatch.hue = 0;
      colorMatch.sat = 0;
      colorMatch.light = matching.lightness;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        color: Color.fromARGB(255, 254, 228, 172),
        child: Text(
          '再玩一次',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          //入場費points = points - 100;
          //入場費Score = Score - 100;
          colorPreviewReset();
          matchesReset();
          Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => Match_Normal(),
          maintainState: false,
          )
          );
        },
      ),
    );
  }
}
class Reset_Hard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var colorPreview = Provider.of<PreviewModel_Hard>(context, listen: true);
    var colorMatch = Provider.of<MatchesModel_Hard>(context, listen: true);

    void matchesReset() {
      matching= HSLColor.fromColor(Color(colorPreview.colorsPreview.value));
      colorMatch.hue = 0;
      colorMatch.sat = 0.0;
      colorMatch.light = 0.0;
    }

    void colorPreviewReset() {
      colorPreview.reset();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        color: Color.fromARGB(255, 254, 228, 172),
        child: Text(
          '再玩一次',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          //入場費points = points - 250;
          //入場費Score = Score - 250;
          colorPreviewReset();
          matchesReset();
          Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => Match_Hard(),
          maintainState: false,
          )
          );
        },
      ),
    );
  }
}
