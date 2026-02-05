import 'package:flutter/material.dart';
import 'uniquecolorgenerator.dart';

class MatchesModel_Easy with ChangeNotifier {
  double _hue = 0.0;

  double get hue => _hue;

  set hue(double value){
    _hue = value;
    notifyListeners();
  }

  double sat = UniqueColorGenerator.targetcolor[1].toDouble();

  double light = UniqueColorGenerator.targetcolor[2].toDouble();

}

class MatchesModel_Normal with ChangeNotifier{
  double _hue = 0.0;
  double _sat = 1.0;

  double get hue => _hue;

  set hue(double value){
    _hue = value;
    notifyListeners();
  }
  double get sat => _sat;
  set sat(double value){
    _sat = value;
    notifyListeners();
  }
  double light = UniqueColorGenerator.targetcolor[2].toDouble();
}

class MatchesModel_Hard with ChangeNotifier{
  double _hue = 0.0;
  double _sat = 1.0;
  double _light = 0.5;

  double get hue => _hue;

  set hue(double value){
    _hue = value;
    notifyListeners();
  }
  double get sat => _sat;
  set sat(double value){
    _sat = value;
    notifyListeners();
  }
  double get light => _light;
  set light(double value){
    _light = value;
    notifyListeners();
  }
}
