import 'package:cc_success/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'matches.dart';
import 'matchesModel.dart';
import 'previewCircle.dart';
import 'previewModel.dart';
import 'new_sliders.dart';
import 'submit.dart';

class Match_Easy extends StatefulWidget {
  @override
  _Match_Easy_State createState() => _Match_Easy_State();
}

class Match_Normal extends StatefulWidget {
  @override
  _Match_Normal_State createState() => _Match_Normal_State();
}

class Match_Hard extends StatefulWidget {
  @override
  _Match_Hard_State createState() => _Match_Hard_State();
}

class _Match_Easy_State extends State<Match_Easy> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    stagediff = 1;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PreviewModel_Easy>(
            create: (context) => PreviewModel_Easy(),
          ),
          ChangeNotifierProvider<MatchesModel_Easy>(
            create: (context) => MatchesModel_Easy(),
          ),
        ],
        child: Scaffold(
            backgroundColor: Color(0xfffff2b8),
            body: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/mix.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: phoneheight / 6,
                  ),
                  Center(
                    child: Text(
                      "調出顏色!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: phoneheight / 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      PreviewCircle_Easy(),
                      Matches_Easy(),
                    ],
                  ),
                  Sliders_Easy(),
                  SizedBox(
                    height: phoneheight / 40,
                  ),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Color(0xffffd685),
                      child: Text(
                        'OK!',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CountDiff(),
                              maintainState: true,
                            ));
                      }),
                ],
              ),
            )));
  }
}

class _Match_Normal_State extends State<Match_Normal> {
  @override
  Widget build(BuildContext context) {
    stagediff = 2;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PreviewModel_Normal>(
            create: (context) => PreviewModel_Normal(),
          ),
          ChangeNotifierProvider<MatchesModel_Normal>(
            create: (context) => MatchesModel_Normal(),
          ),
        ],
        child: Scaffold(
            backgroundColor: Color(0xfffff2b8),
            body: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/mix.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: phoneheight / 6,
                  ),
                  Center(
                    child: Text(
                      "調出顏色!",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: phoneheight / 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      PreviewCircle_Normal(),
                      Matches_Normal(),
                    ],
                  ),
                  Sliders_Normal(),
                  SizedBox(
                    height: phoneheight / 40,
                  ),
                  Submit(),
                ],
              ),
            )));
  }
}

class _Match_Hard_State extends State<Match_Hard> {
  @override
  Widget build(BuildContext context) {
    stagediff = 3;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PreviewModel_Hard>(
            create: (context) => PreviewModel_Hard(),
          ),
          ChangeNotifierProvider<MatchesModel_Hard>(
            create: (context) => MatchesModel_Hard(),
          )
        ],
        child: Scaffold(
            backgroundColor: Color(0xfffff2b8),
            body: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/mix.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: phoneheight / 6,
                  ),
                  Center(
                    child: Text(
                      "調出顏色!",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: phoneheight / 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      PreviewCircle_Hard(),
                      Matches_Hard(),
                    ],
                  ),
                  Sliders_Hard(),
                  SizedBox(
                    height: phoneheight / 40,
                  ),
                  Submit(),
                ],
              ),
            )));
  }
}

class Submit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xffffd685),
        child: Text(
          'OK!',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CountDiff(),
                maintainState: true,
              ));
        });
  }
}
