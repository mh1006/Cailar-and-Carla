import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../color_buttons.dart';
import '/color_adjust/colorfix.dart';
import '/flutter_mix/colormixpage.dart';
import '/save.dart';
import '../sliders.dart';

import 'colorset.dart';
import 'hslcolorsquare.dart';

class ColorPage extends StatefulWidget {
  @override
  _ColorPageState createState() => _ColorPageState();
}

class OfflineColorPage extends StatefulWidget {
  @override
  _OfflineColorState createState() => _OfflineColorState();
}

class _ColorPageState extends State<ColorPage> {
  @override
  Widget build(BuildContext context) {
    leftnright = 2;
    new Timer(Duration(seconds: 1), () {
      setState(() {});
    });
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HSLColorSet>(
            create: (context) => HSLColorSet(),
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
                      top: MediaQuery.of(context).size.height * 0.27,
                      left: 20,
                      right: 20,
                      child: Container(
                        child: MyColor(),
                      )),
                  /*Container(
                   width: MediaQuery.of(context).size.width,
                 padding: const EdgeInsets.only(left:50,right: 50,top:500),
                 alignment: Alignment.center,
                   child: Sliders()

             ),*/
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
                            child: AOfflineButton(),
                          ),
                          Container(
                              padding: EdgeInsets.only(right: 10),
                              width: 60,
                              height: 60,
                              child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromRGBO(255, 226, 128, 1),
                                child: Icon(Icons.save),
                                onPressed: () {
                                  saveid = 0;
                                  saving = fix;
                                  saved=[MyColor.OH,MyColor.OS,MyColor.OL];
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SaveColorPage(),
                                      maintainState: false,
                                    ),
                                  );
                                },
                              )),
                        ]),
                  ),
                ]))));
  }
}

class _OfflineColorState extends State<OfflineColorPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HSLColorSet>(
            create: (context) => HSLColorSet(),
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
                top: MediaQuery.of(context).size.height * 0.25,
                left: 20,
                right: 20,
                child: Container(child: OfflineColor()),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 75, right: 70,top: 475),
                  alignment: Alignment.center,
                  child: HSLSliders()),
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
                        child: AOnlineButton(),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        width: 60,
                        height: 60,
                        child: FloatingActionButton(
                          backgroundColor: Color.fromRGBO(255, 226, 128, 1),
                          child: Icon(Icons.save),
                          onPressed: () {
                            saveid = 0;
                            saving = OfflineColor.color.toColor();
                            saved=[OfflineColor.H,OfflineColor.S,OfflineColor.L];
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
        ));
  }
}
