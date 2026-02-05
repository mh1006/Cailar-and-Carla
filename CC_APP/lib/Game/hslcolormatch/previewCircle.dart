import 'previewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'circle.dart';

class PreviewCircle_Easy extends StatelessWidget{
  static var previewHex;
  @override
  Widget build(BuildContext context) {
  var color = Provider.of<PreviewModel_Easy>(context, listen: true);

  previewHex = color.colorsPreview.value;


  return Column(
    children: [
      Circle(color.colorsPreview),
    ],
  );
  }
}

class PreviewCircle_Normal extends StatelessWidget{
  static var previewHex;
  @override
  Widget build(BuildContext context) {
    var color = Provider.of<PreviewModel_Normal>(context, listen: true);

    previewHex = color.colorsPreview.value;


    return Column(
      children: [
        Circle(color.colorsPreview),
      ],
    );
  }
}
class PreviewCircle_Hard extends StatelessWidget{
  static var previewHex;
  @override
  Widget build(BuildContext context) {
    var color = Provider.of<PreviewModel_Hard>(context, listen: true);

    previewHex = color.colorsPreview.value;


    return Column(
      children: [
        Circle(color.colorsPreview),
      ],
    );
  }
}