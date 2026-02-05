import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final Color color;

  Circle(this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 175,
        height: 175,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            color: color),
      ),
    );
  }
}
