import 'package:flutter/material.dart';

import 'homepage.dart';

class InstructionPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(children: [
      Positioned(
          top: 30,
          left: 5,
          right: 330,
          child: Container(
            width: 5,
            height: 50,
            // ignore: deprecated_member_use
            child: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 50,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                      maintainState: false,
                    ));
              },
            ),
          )),
      Positioned(
        top: 38,
        left: 75,
        right: 150,
        child: Container(
          width: 10,
          height: 50,
          // ignore: deprecated_member_use
          child: Text('操作說明', style: TextStyle(fontSize: 27)),
        ),
      ),
      Positioned(
        top: 100,
        left: 20,
        right: 20,
        child: Text('操作說明在這裡喔～～'),
      )
    ])));
  }
}
