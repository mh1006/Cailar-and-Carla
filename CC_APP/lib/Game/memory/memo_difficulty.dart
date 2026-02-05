import 'package:flutter/material.dart';
import 'memo_easy.dart';
import 'memo_normal.dart';
import 'memo_hard.dart';
import '../gamebutton.dart';


class MemoGame extends StatefulWidget{
  @override
  MemoGameState createState() => MemoGameState();
}

class MemoGameState extends State<MemoGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/memo.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(height: 60),
              Container(
                child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    color: Color.fromARGB(255, 254, 228, 172),
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Memo_Easy(),
                          maintainState: false,
                        ),
                      );
                    },
                    child:Text(
                      "★",
                      style: TextStyle(color: Color.fromRGBO(103, 143, 224, 1.0)),
                    )
                ),
              ),
              Container(
                child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    color: Color.fromARGB(255, 254, 228, 172),
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Memo_Normal(),
                          maintainState: false,
                        ),
                      );
                    },
                    child:Text(
                      "★★★",
                      style: TextStyle(color: Color.fromRGBO(103, 143, 224, 1.0)),
                    )
                ),
              ),
              Container(
                child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    color: Color.fromARGB(255, 254, 228, 172),
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Memo_Hard(),
                          maintainState: false,
                        ),
                      );
                    },
                    child:Text(
                      "★★★★★",
                      style: TextStyle(color: Color.fromRGBO(103, 143, 224, 1.0)),
                    )
                ),
              ),
              const SizedBox(height: 50),
              Container(
                child:GamepageB(),
              ),
              const SizedBox(height: 150),
            ],
          )
      ),
    );
  }
}