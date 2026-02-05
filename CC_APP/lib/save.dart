import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import 'flutter_color/flutter_hsl/hslcircle.dart';
import 'flutter_color/square.dart';

Color saving;
Color saving1;
Color saving2;
String savinghex;
String saving1hex;
String saving2hex;
int saveid;
List<double> saved = [];

class SaveColorPage extends StatefulWidget {
  @override
  _SaveColorState createState() => _SaveColorState();
}

class _SaveColorState extends State<SaveColorPage> {
  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) => Screenshot(
      controller: _screenshotController,
      child: Scaffold(
          body: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("image/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    saveid == 0
                        ? buildAImage()
                        : buildCImage(),
                    const SizedBox(),
                    RaisedButton(
                        color: Color.fromRGBO(255, 226, 128, 1),
                        child: Text('Save to Gallery'),
                        onPressed: () async {
                          final imageFile =
                              await _screenshotController.capture();
                          if (imageFile == null) return;
                          await saveScreenshot(imageFile);
                        })
                  ]))));

  Future<String> saveScreenshot(Uint8List bytes) async {
    await [Permission.storage].request();
    final result = await ImageGallerySaver.saveImage(bytes);
    return result['filePath'];
  }

  Widget buildAImage() => Stack(children: [
        Card(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Square(saving),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(children: [
                  HSLCircle(tohsl(saved[0], 0), 0),
                  Text("H=${saved[0].toInt()}º")
                ]),
                Column(children: [
                  HSLCircle(tohsl(saved[1], 1), 1),
                  Text("S=${(saved[1] * 100).toInt()}%")
                ]),
                Column(children: [
                  HSLCircle(tohsl(saved[2], 2), 2),
                  Text("L=${(saved[2] * 100).toInt()}%")
                ]),
              ])
            ],
          ),
        )),
      ]);


  Widget buildCImage() => Stack(children: [
        Card(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                ColorCard(saving1),
                Text("＋"),
                ColorCard(saving2),
                Text("||"),
                ColorCard(saving),
              ])),
        )
      ]);

  Widget ColorCard(Color c_color) {
    HSLColor h_color = HSLColor.fromColor(c_color);
    List<double> hcs = [h_color.hue,h_color.saturation,h_color.lightness];
    return Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sSquare(c_color),
              SizedBox(
                width: 25,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                HSLCircle(tohsl(hcs[0], 0), 0),
                HSLCircle(tohsl(hcs[1], 1), 1),
                HSLCircle(tohsl(hcs[2], 2), 2),
              ])
            ],
          ),
        ));
  }

    Color torgb(Color n_color, int rgb) {
      if (rgb == 0) {
        Color output = Color.fromRGBO(n_color.red, 0, 0, 1);
        return output;
      } else if (rgb == 1) {
        Color output = Color.fromRGBO(0, n_color.green, 0, 1);
        return output;
      } else {
        Color output = Color.fromRGBO(0, 0, n_color.blue, 1);
        return output;
      }
    }

    Color tohsl(double colorvalue, int hsl) {
      if (hsl == 0) {
        Color output = HSLColor.fromAHSL(1, colorvalue, 1, 0.5).toColor();
        return output;
      } else if (hsl == 1) {
        Color output = HSLColor.fromAHSL(1, 0, 0, colorvalue).toColor();
        return output;
      } else {
        Color output = HSLColor.fromAHSL(1, 0, 0, colorvalue).toColor();
        return output;
      }
    }
  }
