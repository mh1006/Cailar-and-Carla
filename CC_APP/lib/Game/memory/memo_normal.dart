import 'dart:async';

import 'package:cc_success/Game/gamebutton.dart';
import 'package:flutter/material.dart';

import '../gamepage.dart';
import 'data.dart';
import 'memo_difficulty.dart';
import 'model.dart';

int ncorrect;

class Memo_Normal extends StatefulWidget {
  @override
  _Memo_Normal_State createState() => _Memo_Normal_State();
}

class _Memo_Normal_State extends State<Memo_Normal> {
  List<TileModel> gridViewTiles = new List<TileModel>();
  List<TileModel> questionPairs = new List<TileModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reStart_normal();
  }

  void reStart_normal() {
    myPairs = getPairs_Normal();
    myPairs.shuffle();
    ncorrect = 0;
    npoints = 0;
    //入場費Score = Score - 100;
    //入場費points = points - 100;
    gridViewTiles = myPairs;
    Future.delayed(const Duration(seconds: 5), () {
// Here you can write your code

      setState(() {
        print("2 seconds done");
        // Here you can write your code for open new view
        questionPairs = getQuestionPairs_16();
        gridViewTiles = questionPairs;
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffff2b8),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/memo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  ncorrect != 8
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "你的分數: $npoints",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      : Container(),
                  ncorrect != 8
                      ? GridView(
                          shrinkWrap: true,
                          //physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisSpacing: 15,
                                  maxCrossAxisExtent: 100.0),
                          children:
                              List.generate(gridViewTiles.length, (index) {
                            return Tile(
                              imagePathUrl:
                                  gridViewTiles[index].getImageAssetPath(),
                              tileIndex: index,
                              parent: this,
                            );
                          }),
                        )
                      : Container(
                          child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "你得到 ${npoints + 80} 分!",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    points = points + npoints + 80;
                                    Score = Score + npoints + 80;
                                    npoints = 0;
                                    reStart_normal();
                                  });
                                },
                                child: Container(
                                  width: 88,
                                  height: 36,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    color: Color.fromARGB(255, 254, 228, 172),
                                    shadows: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.2),
                                        offset: Offset(0, 1),
                                        blurRadius: 1,
                                        spreadRadius: 0.5,
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      "再玩一次",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              color: Color.fromARGB(255, 254, 228, 172),
                              child: Text(
                                "難度選擇",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                points = points + npoints + 80;
                                Score = Score + npoints + 80;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MemoGame(),
                                      maintainState: false,
                                    ));
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GamepageB(),
                          ],
                        ))
                ],
              ),
            ),
          ),
        ));
  }
}

class Tile extends StatefulWidget {
  String imagePathUrl;
  int tileIndex;
  _Memo_Normal_State parent;

  Tile({this.imagePathUrl, this.tileIndex, this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex].setIsSelected(true);
          });
          if (selectedTile != "") {
            /// testing if the selected tiles are same
            if (selectedIndex == widget.tileIndex) {
              this.widget.parent.setState(() {
                myPairs[widget.tileIndex].setIsSelected(false);
                myPairs[selectedIndex].setIsSelected(false);
              });
              setState(() {
                selected = false;
              });
              selectedTile = "";
            } else if (selectedTile ==
                myPairs[widget.tileIndex].getImageAssetPath()) {
              print("add point");
              ncorrect++;
              npoints = npoints + 65;
              print(selectedTile + " this is" + widget.imagePathUrl);

              TileModel tileModel = new TileModel();
              print(widget.tileIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                tileModel.setImageAssetPath("");
                myPairs[widget.tileIndex] = tileModel;
                print(selectedIndex);
                myPairs[selectedIndex] = tileModel;
                this.widget.parent.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedTile = "";
              });
            } else {
              print(selectedTile +
                  " thishis " +
                  myPairs[widget.tileIndex].getImageAssetPath());
              print("wrong choice");
              if (npoints >= 10) {
                npoints = npoints - 10;
              }
              print(widget.tileIndex);
              print(selectedIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                this.widget.parent.setState(() {
                  myPairs[widget.tileIndex].setIsSelected(false);
                  myPairs[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = myPairs[widget.tileIndex].getImageAssetPath();
              selectedIndex = widget.tileIndex;
            });

            print(selectedTile);
            print(selectedIndex);
          }
        }
      },
      child: Container(
        child: myPairs[widget.tileIndex].getImageAssetPath() != ""
            ? Image.asset(myPairs[widget.tileIndex].getIsSelected()
                ? myPairs[widget.tileIndex].getImageAssetPath()
                : widget.imagePathUrl)
            : Container(color: Colors.transparent),
      ),
    );
  }
}
