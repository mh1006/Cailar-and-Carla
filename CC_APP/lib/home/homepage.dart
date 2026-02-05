import 'package:flutter/material.dart';

import 'homebutton.dart';

bool isReady = false;
double phonewidth;
double phoneheight;
class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    phonewidth = MediaQuery.of(context).size.width;
    phoneheight= MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("image/home.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: [
        Positioned(
          top: phoneheight * 0.5,
          left: phonewidth * 0.05,
          right: phonewidth * 0.05,
          bottom: phoneheight * 0.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                RGBButton(),
                MixButton(),
                ARButton(),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                GameButton(),
                ActiveButton(),
                VSButton(),
              ])
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          left: MediaQuery.of(context).size.width * 0.1,
          child: Container(
            width: MediaQuery.of(context).size.width / 10,
            height: MediaQuery.of(context).size.width / 10,
            //padding: EdgeInsets.only(left: 20,right: 20),
            child: SettingButton(),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          right: MediaQuery.of(context).size.width * 0.1,
          child: Container(
            width: MediaQuery.of(context).size.width / 10,
            height: MediaQuery.of(context).size.width / 10,
            //padding: EdgeInsets.only(left: 20,right: 20),
            child: wifiButton(),
          ),
        ),
      ]),
    ));
  }
}
