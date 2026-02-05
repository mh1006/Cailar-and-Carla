import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gamebutton.dart';
import '../gamepage.dart';
import 'data.dart';
import 'memo_difficulty.dart';
import 'model.dart';

int ecorrect;

class Memo_Easy extends StatefulWidget {
  @override
  _Memo_Easy_State createState() => _Memo_Easy_State();
}

class _Memo_Easy_State extends State<Memo_Easy> {
  List<TileModel> gridViewTiles = new List<TileModel>();
  List<TileModel> questionPairs = new List<TileModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reStart_easy();
  }

  void reStart_easy() {
    myPairs = getPairs_Easy();
    myPairs.shuffle();
    ecorrect = 0;
    epoints = 0;
    gridViewTiles = myPairs;
    Future.delayed(const Duration(seconds: 4), () {
// Here you can write your code

      setState(() {
        print("2 seconds done");
        // Here you can write your code for open new view
        questionPairs = getQuestionPairs_12();
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
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                ecorrect != 6
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "你的分數: $epoints",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    : Container(),
                ecorrect != 6
                    ? GridView(
                        shrinkWrap: true,
                        //physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 15, maxCrossAxisExtent: 120.0),
                        children: List.generate(gridViewTiles.length, (index) {
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
                            "你得到 ${epoints + 50} 分!",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          points = points + epoints + 50;
                          Score = Score + epoints + 50;
                          epoints = 0;
                          reStart_easy();
                        });
                      },
                      child:Container(
                        width: 88,
                        height: 36,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          color: Color.fromARGB(255, 254, 228, 172),
                          shadows: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.2),offset: Offset(0, 1),
                            blurRadius: 1,
                            spreadRadius: 0.5,)],
                        ),
                          child: Center(
                            child: Text(
                              "再玩一次",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),),
                          )

                      ),
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
                              points = points + epoints + 50;
                              Score = Score + epoints + 50;
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
      ),
    );
  }
}

class Tile extends StatefulWidget {
  String imagePathUrl;
  int tileIndex;
  _Memo_Easy_State parent;

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
              ecorrect++;
              epoints = epoints + 50;
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
              if (epoints >= 10) {
                epoints = epoints - 10;
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
