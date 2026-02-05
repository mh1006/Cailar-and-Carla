import 'package:flutter/material.dart';


class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      color: Color.fromARGB(255, 254, 228, 172),
      child: Text(
        "難度選擇",
        style: TextStyle(
            color: Colors.black,
         ),
      ),
    );
    }
}
