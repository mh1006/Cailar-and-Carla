import '../gamepage.dart';
import 'random_map.dart';
import 'package:flutter/material.dart';
import 'dart:math';



int seed = 0;
int w = 0;

final Map<String, bool> score = {};

class dragpage extends StatefulWidget {
  dragpage({Key key}) : super(key: key);
  createState() => dragpageState();
}

class dragpageState extends State<dragpage> {
  Map choices = randommap.newmap();

  void restart() {
    setState(() {
      dragcoin += w;
      coin = dragcoin + diffcoin + mixcoin + rgbcoin;
      Score =Score + dragcoin;
      w = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.width/20,
              left: MediaQuery.of(context).size.width/20,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black54,
                  iconSize: MediaQuery.of(context).size.width/15,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(),
                        maintainState: false,
                      ),
                    );
                    setState(() {
                      restart();
                    });
                  },
                ),
            ), Positioned(
               top: MediaQuery.of(context).size.height/7,
               left: MediaQuery.of(context).size.width/15,
                child: Text('分數 ${w}', style: TextStyle(color: Colors.black, fontSize:30))
            ),Positioned(
                top: MediaQuery.of(context).size.height/5,
                left:MediaQuery.of(context).size.width/100,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Column(
                        children: choices.keys.map((emoji) {
                          return Draggable<String>(
                            data: emoji,
                            child: Emoji(emoji: score[emoji] == true ? '✓︎' : emoji),
                            feedback: Emoji(emoji: emoji),
                            childWhenDragging: Emoji(emoji: '∙∙∙'),
                            onDraggableCanceled: (v,o){
                              setState(() {
                                w -= 10;
                              });
                            },
                          );
                        }).toList()),
                    Column(
                      children:
                      choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                        ..shuffle(Random(seed)),
                    ),
                  ],
            )
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.transparent,
            margin: EdgeInsets.all(30),
            child: Text('答對了!', style: TextStyle(fontSize: 30),),
            alignment: Alignment.center,
            height: 70,
            width: 150,
          );
        } else {
          return Container(
              margin: EdgeInsets.all(30),
              color: choices[emoji],
              height: MediaQuery.of(context).size.height/12,
              width: MediaQuery.of(context).size.width/3,
          );
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          if(score[emoji] = true){
            w += 75;
          }
        }
        );
      },
    );

  }
}



class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji}) : super(key: key);
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height/12,
        width: MediaQuery.of(context).size.width/3,
        margin: EdgeInsets.all(30),
        child: Text(emoji,
          style: TextStyle(color: Colors.black, fontSize:  MediaQuery.of(context).size.width/8),
        ),
      ),
    );
  }
}
