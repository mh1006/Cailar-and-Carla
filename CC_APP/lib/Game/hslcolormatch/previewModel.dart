import 'package:flutter/material.dart';
import 'uniquecolorgenerator.dart';
class PreviewModel_Easy with ChangeNotifier{
  Color colorPreviewModel = UniqueColorGenerator.getColor();
  Color get colorsPreview => colorPreviewModel;

  //reset
  void reset() {
    colorPreviewModel = UniqueColorGenerator.getColor();
    notifyListeners();
  }
}

class PreviewModel_Normal with ChangeNotifier{
  Color colorPreviewModel = UniqueColorGenerator.getColor();
  Color get colorsPreview => colorPreviewModel;

  //reset
  void reset() {
    colorPreviewModel = UniqueColorGenerator.getColor();
    notifyListeners();
  }
}

class PreviewModel_Hard with ChangeNotifier{
  Color colorPreviewModel = UniqueColorGenerator.getColor();
  Color get colorsPreview => colorPreviewModel;

  //reset
  void reset() {
    colorPreviewModel = UniqueColorGenerator.getColor();
    notifyListeners();
  }
}