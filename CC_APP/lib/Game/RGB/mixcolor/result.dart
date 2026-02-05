import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  final int score;
  final int questions;
  final Function resetHandler;
  Result(this.score, this.questions, this.resetHandler);


  @override
  Widget build(BuildContext context) {
    //Score += score*100;
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '+ ${score * 100}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          /*FlatButton(
            onPressed : resetHandler,
            child: Text(
              'RESTART',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
          SizedBox(height: 100,),
          GamepageB(),*/
        ],
      ),
    );
  }
}
