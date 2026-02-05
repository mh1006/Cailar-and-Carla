import 'package:flutter/material.dart';

import 'homepage.dart';

class ProblemPage extends StatefulWidget {
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<ProblemPage> {
  //TextEditingController _1unameController = TextEditingController();
  final TextEditingController probController = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(
      children: [
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
            child: Text('問題回報', style: TextStyle(fontSize: 27)),
          ),
        ),
        Positioned(
          top: 100,
          left: 20,
          right: 20,
          child: TextField(
            maxLength: 20,
            autofocus: true,
            controller: probController, //設定
            decoration: InputDecoration(
              hintText: "請輸入您的問題",
              prefixIcon: Icon(Icons.edit),
            ),
          ),
        ),
        Positioned(
          top: 200,
          left: 50,
          right: 50,
          child: Container(
              width: 10,
              height: 50,
              // ignore: deprecated_member_use
              child: RaisedButton(
                child: Text('送出'),
                onPressed: console,
              )),
        ),
      ],
    )));
  }

  void console() {
    print(probController.text);
  }
}
