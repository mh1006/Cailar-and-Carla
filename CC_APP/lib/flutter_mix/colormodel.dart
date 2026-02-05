import 'package:flutter/material.dart';

import '/flutter_mix/random.dart';
import 'random.dart';

class R1ColorModel with ChangeNotifier {
  Color R1Color = Colors.yellow;

  Color get r1_color => R1Color;

  void r1_reset() {
    R1Color = RandomColor.getvalue();
    notifyListeners();
  }
}

class R2ColorModel with ChangeNotifier {
  Color R2Color = Colors.blue;

  Color get r2_color => R2Color;

  void r2_reset() {
    R2Color = RandomColor.getvalue();
    notifyListeners();
  }
}
