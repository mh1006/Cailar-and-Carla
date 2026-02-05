import 'package:flutter/material.dart';

import '../gamebutton.dart';
import '../gamepage.dart';
import 'match_main.dart';

import 'matchesModel.dart';
import 'previewModel.dart';
import 'package:provider/provider.dart';

HSLColor matching;

class MatchGame extends StatefulWidget{
  @override
  MatchGameState createState() => MatchGameState();
}

class MatchGameState extends State<MatchGame> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider<PreviewModel_Easy>(
        create: (context) => PreviewModel_Easy(),
    ),
    ChangeNotifierProvider<PreviewModel_Normal>(
    create: (context) => PreviewModel_Normal(),
    ),
    ChangeNotifierProvider<PreviewModel_Hard>(
    create: (context) => PreviewModel_Hard(),
    ),
    ChangeNotifierProvider<MatchesModel_Easy>(
    create: (context) => MatchesModel_Easy(),
    ),
    ChangeNotifierProvider<MatchesModel_Normal>(
    create: (context) => MatchesModel_Normal(),
    ),
    ChangeNotifierProvider<MatchesModel_Hard>(
    create: (context) => MatchesModel_Hard(),
    )
    ],child:Scaffold(
      body: Container(
        alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/mix.png"),
              fit: BoxFit.fill,
            ),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(height: 80),
            Text(
              "選擇難度",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
            Container(
              child: Start_Easy()
              ),
            Container(
                child: Start_Normal(),
            ),
            Container(
              child: Start_Hard(),
            ),
            const SizedBox(height: 50),
            Container(
              child:GamepageB(),
            ),
            const SizedBox(height: 150),
          ],
        )
      ),
    ));
  }
}

class Start_Easy extends StatelessWidget{
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        color: Color.fromARGB(255, 254, 228, 172),
        child: Text(
          "★",
          style: TextStyle(color: Colors.blueGrey),
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
class Start_Normal extends StatelessWidget{
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        color: Color.fromARGB(255, 254, 228, 172),
        child: Text(
          '★★★',
          style: TextStyle(color: Colors.blueGrey),
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
class Start_Hard extends StatelessWidget{
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        color: Color.fromARGB(255, 254, 228, 172),
        child: Text(
          '★★★★★',
          style: TextStyle(color: Colors.blueGrey),
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

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        color: Color.fromARGB(255, 254, 228, 172),
        child: Text(
          '選擇難度',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MatchGame(),
                maintainState: false,
              )
          );
        },
      ),
    );
  }
}
