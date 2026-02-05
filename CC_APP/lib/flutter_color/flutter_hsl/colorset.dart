import 'package:flutter/material.dart';

class HSLColorSet extends ChangeNotifier {
  double _H = 0;
  double _S = 1.0;
  double _L = 0.5;

  double get H => _H;

  set H(double value) {
    _H = value;
    notifyListeners();
  }

  double get S => _S;

  set S(double value) {
    _S = value;
    notifyListeners();
  }

  double get L => _L;

  set L(double value) {
    _L = value;
    notifyListeners();
  }
}
