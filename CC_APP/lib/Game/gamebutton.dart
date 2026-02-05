import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'RGB/mixcolor/mixmain.dart';
import 'hslcolormatch/match_difficulty.dart';
import 'diff/diffmain.dart';
import 'drag and drop/dragmain.dart';
import 'gamepage.dart';
import 'Sort/gamesort.dart';
import 'memory/memo_difficulty.dart';


class FirstGame extends StatelessWidget{
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      color: Color.fromARGB(255, 254, 228, 172),
      child: Text(
        '選擇題',
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      onPressed: () {
        mixcoin = 0;
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => mixcolorpage(),
            maintainState: false,
          ),
        );
      },
    );
  }
}
class SecondGame extends StatelessWidget{
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      color: Color.fromARGB(255, 254, 228, 172),
      child: Text(
        '找不同',
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => diffpage(),
            maintainState: false,
          ),
        );
      },
    );
  }
}
class ThirdGame extends StatelessWidget{
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      color: Color.fromARGB(255, 254, 228, 172),
      child: Text(
        '拖曳',
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => dragpage(),
            maintainState: false,
          ),
        );
      },
    );
  }
}

class ForthGame extends StatelessWidget{
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      color: Color.fromARGB(255, 254, 228, 172),
      child: Text(
        '排序',
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  SortPage(),
            maintainState: false,
          ),
        );

      },
    );
  }
}
class FifthGame extends StatelessWidget{
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      color: Color.fromARGB(255, 254, 228, 172),
      child: Text(
        '混色',
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MatchGame(),
            maintainState: false,
          ),
        );
      },
    );
  }
}

class SixthGame extends StatelessWidget{
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      color: Color.fromARGB(255, 254, 228, 172),
      child: Text(
        '記憶',
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MemoGame(),
            maintainState: false,
          ),
        );
      },
    );
  }
}

class GamepageB extends StatelessWidget{
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      color: Color.fromARGB(255, 254, 228, 172),
      child: Text(
        '離開',
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GamePage(),
            maintainState: false,
          ),
        );
      },
    );
  }
}