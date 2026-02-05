import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import '../../gamepage.dart';
import 'random-rgb.dart';
import 'options.dart';
import 'result.dart';


class mixcolorpage extends StatefulWidget {
  mixcolorpage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _mixcolorpageState createState() => _mixcolorpageState();
}

class _mixcolorpageState extends State<mixcolorpage> {

  Random random = Random();
  int totalScore = 0;
  int questionCount = 0;

  void answerChooseHandler(int r, int g, int b) {
    if(r == (randomR+r2)~/2 && g == (randomG+g2)~/2 && b  == (randomB+b2)~/2) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "Correct",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
      );
      setState(() {
        totalScore += 1;
        questionCount += 1;
      });
    }else {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "Wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      setState(() {
        questionCount += 1;
      });
    }
  }

  void resetHanlder() {
    setState(() {
      totalScore = 0;
      questionCount = 0;
    });
  }

  void mixback(){
    totalScore *= 100;
    mixcoin += totalScore;
    coin = dragcoin + diffcoin + mixcoin + rgbcoin;
    Score = Score + mixcoin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/image/1.png"),
          fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
                top: MediaQuery.of(context).size.width/20,
                left: MediaQuery.of(context).size.width/20,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black54,
                  iconSize: MediaQuery.of(context).size.width/15,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(),
                        maintainState: false,
                      ),
                    ); setState(() {
                      mixback();
                    });
                  },
            )
            ), Positioned(
                child: questionCount < 5 ?
                    Column(
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height/8,),
                        RGB(),
                        ColorOptions(answerChooseHandler),
                      ],
                    ) :
                    Result(totalScore, questionCount, resetHanlder)
            )
          ],
        ),
      ),
    );
  }
}
