import 'dart:math';
import 'package:flutter/material.dart';

int r2;
int g2;
int b2;

int randomR;
int randomG;
int randomB;

class RGB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    randomR = Random().nextInt(256);
    randomG = Random().nextInt(256);
    randomB = Random().nextInt(256);
    r2 = Random().nextInt(256);
    g2 = Random().nextInt(256);
    b2 = Random().nextInt(256);

    return Center(
      child: Stack(
          children:[
            Positioned(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width/12, //水平
                      vertical: MediaQuery.of(context).size.width/3.5, //垂直
                    ),
                    color: Colors.transparent,),
                  Container(
                    width: MediaQuery.of(context).size.width/3.5,
                    height:MediaQuery.of(context).size.width/3.5,
                    color: Color.fromRGBO(r2, g2, b2, 1),),
                  Text(
                    '+', style: TextStyle(fontSize: MediaQuery.of(context).size.width/6),),
                  Container(
                    width: MediaQuery.of(context).size.width/3.5,
                    height:MediaQuery.of(context).size.width/3.5,
                    color: Color.fromRGBO(randomR, randomG, randomB, 1),),
                ],
              ),
            )


              /*  child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width/6, //水平
                    vertical: MediaQuery.of(context).size.width/6, //垂直
                  ),
                  width: MediaQuery.of(context).size.width/4,
                  height: MediaQuery.of(context).size.width/3,
                  color: Colors.transparent,
                )
            ),Positioned(//+右
                top: MediaQuery.of(context).size.height/15,
                left:MediaQuery.of(context).size.width/10,
                child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.width/3,
                  margin: EdgeInsets.only(top: 50, left: 70, bottom: 50),
                  color: Color.fromRGBO(randomR, randomG, randomB, 1),
                )
            ),
            Positioned(
                top:MediaQuery.of(context).size.height/12,
                right: MediaQuery.of(context).size.width/6,
                //right: 100,
                child: Container(//左
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.width/3,
                  margin: EdgeInsets.only(top: 50, right: 70, bottom: 50),
                  color: Color.fromRGBO(r2, g2, b2, 1),
                )
            ), Positioned(
                top: MediaQuery.of(context).size.height/12+MediaQuery.of(context).size.width/6,
                right: MediaQuery.of(context).size.width/4.15,
                child: Text('+', style: TextStyle(fontSize: MediaQuery.of(context).size.width/6),),
            ),*/
          ]
      ),
      );
  }

}








































  /*Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30
      ),
      child: Card(
        child: Container(
          width: 50,
          height: 50,
          color: Colors.deepOrangeAccent,
          //padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'RGB($randomR, $randomG, $randomB)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
  }*/


