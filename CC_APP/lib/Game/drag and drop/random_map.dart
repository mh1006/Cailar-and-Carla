import 'dart:math';
import 'package:flutter/material.dart';

Random random = Random();


class randommap{

  static Map newmap(){

    int sco = random.nextInt(3);
    switch(sco){
      case 0:
        var fruit= {
          '🍎': Color.fromRGBO(255, 0, 0, 1.0),
          '🍌': Color.fromRGBO(251, 212, 59, 1.0),
          '🍇': Color.fromRGBO(123, 79, 119, 1.0),
          '🍏': Color.fromRGBO(132, 248, 17, 1.0),
        };
        return fruit;
        //break;
      case 1:
        var heart = {
          '❤️': Color.fromRGBO(251, 0, 20, 1.0),
          '💙': Color.fromRGBO(24, 90, 244, 1.0),
          '💚': Color.fromRGBO(75, 204, 49, 1.0),
          '💜': Color.fromRGBO(139, 31, 203, 1.0),
        };
        return heart;
        //break;
      case 2:
        var food = {
          '️🥕': Color.fromRGBO(241, 113, 46, 1.0),
          '🥦': Color.fromRGBO(97, 171, 34, 1.0),
          '🌶': Color.fromRGBO(203, 40, 47, 1.0),
          '🍆': Color.fromRGBO(123, 79, 119, 1.0),
        };
        return food;
    }
  }

}

