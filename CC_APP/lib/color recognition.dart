import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("功能1"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              // ignore: deprecated_member_use
              RaisedButton(
                child: Text('Home'),
                onPressed: () {
                  Navigator.pop(context);
                },
                // ignore: deprecated_member_use
              )
            ])));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("功能2"),
        ),
        body: Center(
            // ignore: deprecated_member_use
            child: RaisedButton(
          child: Text('Home'),
          onPressed: () {
            Navigator.pop(context);
          },
        )));
  }
}
