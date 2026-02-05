import 'package:flutter/material.dart';

class HSLCircle extends StatelessWidget {
  final int hsl;
  final Color color;

  HSLCircle(this.color, this.hsl);

  @override
  Widget build(BuildContext context) {
    HSLColor hcolor = HSLColor.fromColor(color);
    if (hsl == 0) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                color: color,
              ),
              child: Row(children: [
                Column(children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                   Row(children: [
                     SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                     Text(
                    "${(hcolor.hue).toInt().toString()}º",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: hcolor.hue>=180 ?Colors.white :Colors.black,
                      fontSize: 10,
                    ),),
                     ]),
                ]),
              ])));
    } else if (hsl == 1) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                color: color,
              ),
              child: Row(children: [
                Column(children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Row(children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.012),
            Text(
              "${((hcolor.lightness)*100).toInt().toString()}%",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: hcolor.lightness<=0.5 ?Colors.white :Colors.black,
                    fontSize: 10,
              ),),]),
                ]),
              ])));
    } else if (hsl == 2) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                color: color,
              ),
              child: Row(children: [
                Column(children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Row(children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.012),
            Text(
                    "${((hcolor.lightness)*100).toInt().toString()}%",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: hcolor.lightness<=0.5 ?Colors.white :Colors.black,
                      fontSize: 10,
                    ),),
                ]),]),
              ])));
    }
  }
}
