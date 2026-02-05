import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showAlertDialog1(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 254, 228, 172),
        title: new Text("HSL!", style: TextStyle(color: Colors.black),),
        content: new Text("看到題目後請回答正確答案", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          new FlatButton(
            color: Color.fromARGB(255, 253, 196, 106),
            child: new Text("OK", style: TextStyle(color: Colors.black),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
void showAlertDialog2(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 254, 228, 172),
        title: new Text("Different!", style: TextStyle(color: Colors.black),),
        content: new Text("限時15秒，找出不一樣的顏色", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          new FlatButton(
            color: Color.fromARGB(255, 253, 196, 106),
            child: new Text("OK", style: TextStyle(color: Colors.black),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
void showAlertDialog3(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 254, 228, 172),
        title: new Text("Drag!", style: TextStyle(color: Colors.black),),
        content: new Text("將圖案放到正確的顏色上", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          new FlatButton(
            color: Color.fromARGB(255, 253, 196, 106),
            child: new Text("OK", style: TextStyle(color: Colors.black),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
void showAlertDialog4(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 254, 228, 172),
        title: new Text("Sort!", style: TextStyle(color: Colors.black),),
        content: new Text("請依照題目排序", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          new FlatButton(
            color: Color.fromARGB(255, 253, 196, 106),
            child: new Text("OK", style: TextStyle(color: Colors.black),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
void showAlertDialog5(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 254, 228, 172),
        title: new Text("Match!", style: TextStyle(color: Colors.black),),
        content: new Text("利用HSL調出指定的顏色", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          new FlatButton(
            color: Color.fromARGB(255, 253, 196, 106),
            child: new Text("OK", style: TextStyle(color: Colors.black),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
void showAlertDialog6(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 254, 228, 172),
        title: new Text("Memory!", style: TextStyle(color: Colors.black),),
        content: new Text("翻出相同顏色的卡牌", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          new FlatButton(
            color: Color.fromARGB(255, 253, 196, 106),
            child: new Text("OK", style: TextStyle(color: Colors.black),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}