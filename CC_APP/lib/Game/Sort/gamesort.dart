import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/Game/Sort/sort1.dart';
import '/Game/Sort/sort2.dart';
import '/Game/Sort/sort3.dart';
import '/Game/Sort/sort4.dart';

import '../gamebutton.dart';




class SortPage extends StatefulWidget{
  @override
  SortPageState createState() => SortPageState();
}

class SortPageState extends State<SortPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("image/db.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(height: 80),
              Text(
                "選擇難度",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
              Container(
                child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    color: Color.fromARGB(255, 254, 228, 172),
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Seasy(),
                          maintainState: false,
                        ),
                      );
                    },
                    child:Text(
                      "　　★　　",
                      style: TextStyle(fontSize: 15, color: Color.fromARGB(164, 148, 57, 226)),
                    )
                ),
              ),
              Container(
                child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    color: Color.fromARGB(255, 254, 228, 172),
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Snormal(),
                          maintainState: false,
                        ),
                      );
                    },
                    child:Text(
                      "　★★★　",
                      style: TextStyle(fontSize: 15, color: Color.fromARGB(164, 148, 57, 226)),
                    )
                ),
              ),
              Container(
                child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    color: Color.fromARGB(255, 254, 228, 172),
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Shard(),
                          maintainState: false,
                        ),
                      );
                    },
                    child:Text(
                      "★★★★★",
                      style: TextStyle(fontSize: 15, color: Color.fromARGB(164, 148, 57, 226)),
                    )
                ),
              ),
              Container(
                child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    color: Color.fromARGB(255, 254, 228, 172),
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Smon(),
                          maintainState: false,
                        ),
                      );
                    },
                    child:Text(
                      "★★★★★★",
                      style: TextStyle(fontSize: 15, color: Color.fromARGB(
                          255, 226, 57, 57)),
                    )
                ),
              ),
              const SizedBox(height: 50),
              Container(
                child:GamepageB(),
              ),
              const SizedBox(height: 150),
            ],
          )
      ),
    );
  }
}

