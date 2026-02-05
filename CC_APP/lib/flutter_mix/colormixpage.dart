import 'dart:async';

import 'package:cc_success/flutter_color/color_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../save.dart';
import 'colormodel.dart';
import 'mixedcolors.dart';
import 'valuelisten.dart';

int leftnright;

class ColorMixPage extends StatefulWidget {
  @override
  _ColorMixPageState createState() => _ColorMixPageState();
}

class _ColorMixPageState extends State<ColorMixPage> {
  List<bool> isSelected = [false, false];

  @override
  Widget build(BuildContext context) {
    new Timer(Duration(seconds: 1), () {
      setState(() {});
    });
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<R1ColorModel>(
          create: (context) => R1ColorModel(),
        ),
        ChangeNotifierProvider<R2ColorModel>(
          create: (context) => R2ColorModel(),
        ),
      ],
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Cube(),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.75,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(1),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      LeftRight(),
                    ])),
          ),
          Positioned(
            bottom: 10,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  width: 60,
                  height: 60,
                  child: HomeButton(),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  width: 60,
                  height: 60,
                  child: COfflineButton(),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  width: 60,
                  height: 60,
                  child: FloatingActionButton(
                    backgroundColor: Color.fromRGBO(255, 226, 128, 1),
                    child: Icon(Icons.save),
                    onPressed: () {
                      saveid = 2;
                      saving = mix_rgb;
                      saving1 = Cube.mycolor[0];
                      saving2 = Cube.mycolor[1];
                      savinghex = (mix_rgb.value.toRadixString(16))
                          .substring(2)
                          .toUpperCase();
                      saving1hex = (saving1.value.toRadixString(
                              16)) //(FirstColor.f_rgb.value.toRadixString(16))
                          .substring(2)
                          .toUpperCase();
                      saving2hex = (saving2.value.toRadixString(
                              16)) //(SecondColor.s_rgb.value.toRadixString(16))
                          .substring(2)
                          .toUpperCase();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SaveColorPage(),
                          maintainState: false,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      )),
    );
  }

  Widget LeftRight() => Container(
      color: Color.fromRGBO(255, 226, 128, 1),
      child: ToggleButtons(
        isSelected: isSelected,
        color: Color.fromRGBO(255, 226, 128, 1),
        fillColor: Color.fromRGBO(255, 183, 106, 1.0),
        children: <Widget>[
          Icon(
            Icons.arrow_left,
            color: Colors.white,
          ),
          Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
        ],
        onPressed: (int newindex) {
          setState(() {
            for (int index = 0; index < isSelected.length; index++) {
              if (index == newindex) {
                isSelected[index] = true;
                if (index == 0) {
                  leftnright = 0;
                } else if (index == 1) {
                  leftnright = 1;
                }
              } else {
                isSelected[index] = false;
              }
            }
          });
        },
      ));
}

class OfflineMixPage extends StatefulWidget {
  @override
  _OfflineMixState createState() => _OfflineMixState();
}

class _OfflineMixState extends State<OfflineMixPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<R1ColorModel>(
          create: (context) => R1ColorModel(),
        ),
        ChangeNotifierProvider<R2ColorModel>(
          create: (context) => R2ColorModel(),
        ),
      ],
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("image/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.40,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    R1Color(),
                    R2Color(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: RMixedColor(),
                  )),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.75,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(1),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        R1control(),
                        R2control(),
                      ])),
            ),
            Positioned(
              bottom: 10,
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: 60,
                      height: 60,
                      child: HomeButton(),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      width: 60,
                      height: 60,
                      child: COnlineButton(),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      width: 60,
                      height: 60,
                      child: FloatingActionButton(
                        backgroundColor: Color.fromRGBO(255, 226, 128, 1),
                        child: Icon(Icons.save),
                        onPressed: () {
                          saveid = 2;
                          saving = RMixedColor.rmix_rgb;
                          saving1 = R1Color.r1_rgb;
                          saving2 = R2Color.r2_rgb;
                          savinghex =
                              (RMixedColor.rmix_rgb.value.toRadixString(16))
                                  .substring(2)
                                  .toUpperCase();
                          saving1hex = (R1Color.r1_rgb.value.toRadixString(16))
                              .substring(2)
                              .toUpperCase();
                          saving2hex = (R2Color.r2_rgb.value.toRadixString(16))
                              .substring(2)
                              .toUpperCase();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SaveColorPage(),
                              maintainState: false,
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}
