import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../gamebutton.dart';
import '../gamepage.dart';
import 'match_difficulty.dart';
import 'matches.dart';
import 'matchesModel.dart';
import 'previewCircle.dart';
import 'previewModel.dart';
import 'reset.dart';

int stagediff;
HSLColor qq, aa;

class CountDiff extends StatelessWidget {
  var diff;
  var level;
  int yourpoint;

  int countdiff(var a, var b) {
    HSLColor A = HSLColor.fromColor(Color(a));
    HSLColor B = HSLColor.fromColor(Color(b));
    var Hp = (A.hue - B.hue).toInt().abs();
    var Sp = ((A.saturation - B.saturation) * 100).toInt().abs();
    var Lp = ((A.lightness - B.lightness) * 100).toInt().abs();
    diff = (Hscore(Hp) * 0.6 + Sscore(Sp) * 0.2 + Lscore(Lp) * 0.2).toInt();

    if (diff > 92) {
      level = 3;
    } else if (diff > 80) {
      level = 2;
    } else if (diff > 75) {
      level = 1;
    } else {
      level = 0;
    }
    if (stagediff == 1) {
      yourpoint = level * 100 + 50;
      points = points + yourpoint;
      Score = Score + yourpoint;
      return yourpoint;
    } else if (stagediff == 2) {
      yourpoint = level * 100;
      if (yourpoint == 300) {
        yourpoint = 350;
      }
      yourpoint += 250;
      points = points + yourpoint;
      Score = Score + yourpoint;
      return yourpoint;
    } else if (stagediff == 3) {
      yourpoint = level * 150;
      if (yourpoint == 450) {
        yourpoint = 500;
      }
      yourpoint += 500;
      points = points + yourpoint;
      Score = Score + yourpoint;
      return yourpoint;
    }
  }

  //Map運算
  int map(var x, var in_min, var in_max, var out_min, var out_max) {
    var score =
        (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
    return score.toInt();
  }

  int Hscore(var hp) {
    int hscore;
    if (hp > 180) {
      hp = 360 - hp;
    }
    if (hp > 90) {
      hscore = 0;
    } else {
      hscore = map(hp, 0, 180, 100, 0);
    }
    return hscore;
  }

  int Sscore(var sp) {
    int sscore;
    if (sp > 50) {
      sscore = 0;
    } else {
      sscore = map(sp, 0, 100, 100, 0);
    }
    return sscore;
  }

  int Lscore(var lp) {
    int lscore;
    if (lp > 50) {
      lscore = 0;
    } else {
      lscore = map(lp, 0, 100, 100, 0);
    }
    return lscore;
  }

  @override
  Widget build(BuildContext context) {
    int getpoint;
    getpoint = 0;
    switch (stagediff) {
      case 1:
        qq = HSLColor.fromColor(Color(PreviewCircle_Easy.previewHex));
        int QR = qq.hue.toInt();
        int QG = (qq.saturation * 100).toInt();
        int QB = (qq.lightness * 100).toInt();
        aa = HSLColor.fromColor(Color(Matches_Easy.matchHex));
        int AR = aa.hue.toInt();
        int AG = (aa.saturation * 100).toInt();
        int AB = (aa.lightness * 100).toInt();
        getpoint =
            countdiff(PreviewCircle_Easy.previewHex, Matches_Easy.matchHex);

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
                body: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/mix.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 150,
                                color: Color(PreviewCircle_Easy.previewHex),
                              ),
                              Container(
                                width: 150,
                                height: 150,
                                color: Color(Matches_Easy.matchHex),
                              )
                            ]),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(children: <Widget>[
                                Text(
                                  "正確顏色",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "H=${QR}º,S=${QG}%,L=${QB}%",
                                  textAlign: TextAlign.center,
                                )
                              ]),
                              SizedBox(
                                width: 30,
                              ),
                              Column(children: <Widget>[
                                Text(
                                  "你的顏色",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "H=${AR}º,S=${AG}%,L=${AB}%",
                                  textAlign: TextAlign.center,
                                )
                              ])
                            ]),
                        SizedBox(height: 25),
                        Container(
                            child: Text(
                          "+${getpoint}",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        )),
                        SizedBox(height: 10),
                        Reset_Easy(),
                        HomeButton(),
                        GamepageB(),
                      ],
                    ))));
      case 2:
        qq = HSLColor.fromColor(Color(PreviewCircle_Normal.previewHex));
        int QR = qq.hue.toInt();
        int QG = (qq.saturation * 100).toInt();
        int QB = (qq.lightness * 100).toInt();
        aa = HSLColor.fromColor(Color(Matches_Normal.matchHex));
        int AR = aa.hue.toInt();
        int AG = (aa.saturation * 100).toInt();
        int AB = (aa.lightness * 100).toInt();
        getpoint =
            countdiff(PreviewCircle_Normal.previewHex, Matches_Normal.matchHex);

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
                body: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/mix.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 150,
                                color: Color(PreviewCircle_Normal.previewHex),
                              ),
                              Container(
                                width: 150,
                                height: 150,
                                color: Color(Matches_Normal.matchHex),
                              )
                            ]),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(children: <Widget>[
                                Text(
                                  "正確顏色",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "H=${QR}º,S=${QG}%,L=${QB}%",
                                  textAlign: TextAlign.center,
                                )
                              ]),
                              SizedBox(
                                width: 30,
                              ),
                              Column(children: <Widget>[
                                Text(
                                  "你的顏色",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "H=${AR}º,S=${AG}%,L=${AB}%",
                                  textAlign: TextAlign.center,
                                )
                              ])
                            ]),
                        SizedBox(height: 25),
                        Container(
                            child: Text(
                          "+${getpoint}",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        )),
                        SizedBox(height: 10),
                        Reset_Normal(),
                        HomeButton(),
                        GamepageB(),
                      ],
                    ))));
      case 3:
        qq = HSLColor.fromColor(Color(PreviewCircle_Hard.previewHex));
        int QR = qq.hue.toInt();
        int QG = (qq.saturation * 100).toInt();
        int QB = (qq.lightness * 100).toInt();
        aa = HSLColor.fromColor(Color(Matches_Hard.matchHex));
        int AR = aa.hue.toInt();
        int AG = (aa.saturation * 100).toInt();
        int AB = (aa.lightness * 100).toInt();
        getpoint =
            countdiff(PreviewCircle_Hard.previewHex, Matches_Hard.matchHex);

        return MultiProvider(
            providers: [
              ChangeNotifierProvider<PreviewModel_Hard>(
                create: (context) => PreviewModel_Hard(),
              ),
              ChangeNotifierProvider<MatchesModel_Hard>(
                create: (context) => MatchesModel_Hard(),
              ),
            ],
            child: Scaffold(
                body: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/mix.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 150,
                                color: Color(PreviewCircle_Hard.previewHex),
                              ),
                              Container(
                                width: 150,
                                height: 150,
                                color: Color(Matches_Hard.matchHex),
                              )
                            ]),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(children: <Widget>[
                                Text(
                                  "正確顏色",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "H=${QR}º,S=${QG}%,L=${QB}%",
                                  textAlign: TextAlign.center,
                                )
                              ]),
                              SizedBox(
                                width: 30,
                              ),
                              Column(children: <Widget>[
                                Text(
                                  "你的顏色",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "H=${AR}º,S=${AG}%,L=${AB}%",
                                  textAlign: TextAlign.center,
                                )
                              ])
                            ]),
                        SizedBox(height: 25),
                        Container(
                            child: Text(
                          "+${getpoint}",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        )),
                        SizedBox(height: 10),
                        Reset_Hard(),
                        HomeButton(),
                        GamepageB(),
                      ],
                    ))));
    }
  }
}
