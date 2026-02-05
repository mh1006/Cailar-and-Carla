import 'package:cc_success/home/homepage.dart';
import 'package:cc_success/videos/cc_link.dart';
import "package:flutter/material.dart";

class LinkPage extends StatefulWidget {
  @override
  _LinkPageState createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              child: Padding(
                  padding: EdgeInsets.only(top:phoneheight*0.25,left:phonewidth*0.1,right: phonewidth*0.1),
                  child: ListView(children: [
                    RaisedButton(
                      color: Color.fromRGBO(255, 226, 128, 1),
                      child: Text(
                        "凱拉小教室_HSL",
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HSLLink(
                                    url: "https://youtu.be/s_WlMfORqZ8")));
                      },
                    ),
                    RaisedButton(
                      color: Color.fromRGBO(255, 226, 128, 1),
                      child: Text(
                        "凱拉小教室_色相環",
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HSLLink(
                                    url: "https://youtu.be/FUVVHr2s3oI")));
                      },
                    ),
                    RaisedButton(
                      color: Color.fromRGBO(255, 226, 128, 1),
                      child: Text(
                        "凱拉小教室_對比色",
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HSLLink(
                                    url: "https://youtu.be/AxREI9iVaSo")));
                      },
                    ),
                  ])),
            )));
  }
}

class BacktoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
        ),
        color: Color.fromRGBO(255, 226, 128, 1),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LinkPage()));
        });
  }
}
