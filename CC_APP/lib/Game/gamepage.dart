import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/home/homepage.dart';
import 'gamebutton.dart';
import 'gamedialog.dart';
import 'hslcolormatch/matchesModel.dart';
import 'hslcolormatch/previewModel.dart';

int points = 0;
int dragcoin = 0;
int diffcoin = 0;
int mixcoin = 0;
int rgbcoin = 0;
int coin = 0;
int sscore = 0;
int Score = 0;

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: true,
                backgroundColor: Color.fromARGB(255, 254, 228, 172),
                title: Text(
                  "Scores:$Score",
                  style: TextStyle(color: Colors.black45),
                ),
                leading: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(),
                            maintainState: false));
                  },
                )),
            body: Container(
              margin: EdgeInsets.symmetric(vertical: 0.0), //edge
              height: MediaQuery.of(context).size.height,
              //enableInfiniteScroll: true,//cycle
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      //alignment: Alignment.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 6),
                          Positioned(
                            //top: 120,
                            //left: 250,
                            child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromRGBO(246, 51, 51, 1.0),
                                child: Icon(Icons.circle_notifications),
                                onPressed: () {
                                  showAlertDialog1(context);
                                }),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).size.height / 2),
                          Positioned(
                            child: FirstGame(),
                          ),
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      //borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("image/a.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
/*
              Positioned(
                left: 15.0,
                top: 30.0,
                child: FloatingActionButton(
                    backgroundColor: Color.fromRGBO(255, 226, 128, 1),
                    child: Icon(Icons.circle_notifications),
                    onPressed: (){showAlertDialog(context);}
                ),*/
                  ),
                  Container(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      //alignment: Alignment.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height / 6 + 5),
                          Positioned(
                            //top: 120,
                            //left: 250,
                            child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromRGBO(232, 138, 79, 1.0),
                                child: Icon(Icons.circle_notifications),
                                onPressed: () {
                                  showAlertDialog2(context);
                                }),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).size.height / 2 -
                                  5),
                          Positioned(
                            child: SecondGame(),
                          ),
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      //borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("image/b.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      //alignment: Alignment.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 6),
                          Positioned(
                            //top: 120,
                            //left: 250,
                            child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromRGBO(232, 207, 54, 1.0),
                                child: Icon(Icons.circle_notifications),
                                onPressed: () {
                                  showAlertDialog3(context);
                                }),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).size.height / 2),
                          Positioned(
                            child: ThirdGame(),
                          ),
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      //borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("image/c.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      //alignment: Alignment.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 6),
                          Positioned(
                            //top: 120,
                            //left: 250,
                            child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromRGBO(139, 191, 99, 1.0),
                                child: Icon(Icons.circle_notifications),
                                onPressed: () {
                                  showAlertDialog4(context);
                                }),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).size.height / 2),
                          Positioned(
                            child: ForthGame(),
                          ),
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      //borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("image/d.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      //alignment: Alignment.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height / 6 + 10),
                          Positioned(
                            //top: 120,
                            //left: 250,
                            child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromRGBO(103, 143, 224, 1.0),
                                child: Icon(Icons.circle_notifications),
                                onPressed: () {
                                  showAlertDialog5(context);
                                }),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).size.height / 2 -
                                  10),
                          Positioned(
                            child: FifthGame(),
                          ),
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      //borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("image/e.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      //alignment: Alignment.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 6),
                          Positioned(
                            //top: 120,
                            //left: 250,
                            child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromRGBO(185, 100, 186, 1.0),
                                child: Icon(Icons.circle_notifications),
                                onPressed: () {
                                  showAlertDialog6(context);
                                }),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).size.height / 2),
                          Positioned(
                            child: SixthGame(),
                          ),
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      //borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("image/f.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        );
  }
}
