import 'package:flutter/material.dart';

class ColorOption extends StatelessWidget {
  final rgb;
  Function optionChoosenHandler;

  ColorOption(this.rgb, this.optionChoosenHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          optionChoosenHandler(rgb['r'], rgb['g'], rgb['b']);
        },
        child: Container(
          width: MediaQuery.of(context).size.width/3,
          height:MediaQuery.of(context).size.width/3,
          color: Color.fromRGBO(rgb['r'], rgb['g'], rgb['b'], 1),
          //margin: EdgeInsets.all(5),
        )
      )
    );
  }
}
