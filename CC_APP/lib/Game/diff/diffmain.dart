import 'dart:async';
//import 'dart:html';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../gamepage.dart';




class diffpage extends StatefulWidget {
  diffpage({Key key}) : super(key: key);

  @override
  _diffpageState createState() => _diffpageState();
}

class _diffpageState extends State<diffpage> {
  bool _gameOver = false;
  int _seconds = 15;
  int _score = 0;
  int _bestscore = 0;
  int _crossAxisCount = 2;
  int _diffIndex;
  Color _diffColor;
  Color _color;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  void _updateData() async {
    final crossAxisCount = math.min(10, (((_score/50)+ 5) / 2).floor());
    final rand = math.Random();
    final diffIndex = rand.nextInt(crossAxisCount * crossAxisCount);
    final color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(1);
    final diffColor = color.withOpacity(math.min(0.95, 0.5 + (_score/50) / 100));

    var prefs = await SharedPreferences.getInstance();
    var bestscore = prefs.getInt('BEST') ?? 0;

    if (bestscore < _score) {
      await prefs.setInt('BEST', _score);
      bestscore = _score;
    }

    setState(() {
      _diffIndex = diffIndex;
      _color = color;
      _diffColor = diffColor;
      _crossAxisCount = crossAxisCount;
      _bestscore = bestscore;
    });
  }

  void _setGameOver() {
    setState(() {
      _seconds = 0;
      _gameOver = true;
    });
  }

  void _restart() {
    setState(() {
      _gameOver = false;
      _score = 0;
      _seconds = 15;

    });
    _updateData();
  }

  void _setTimer() {
    Timer.periodic(
      Duration(seconds: 1),
          (Timer t) {
        if (_seconds <= 0) {
          t.cancel();
          _setGameOver();
          diffcoin = diffcoin - 100;
        } else {
          setState(() {
            _seconds = _seconds - 1;
          });
        }
      },
    );
  }

  void _onTimePressed() {
    if (_gameOver) {
      //_restart();
    } else {
      _setGameOver();
    }
  }

  void _onColorPressed(int index) {
    if (!_gameOver && index == _diffIndex) {
      if (_score == 0) {
        _setTimer();
      }
      _updateData();
      setState(() {
        _score = _score + 50;
      });
    }
  }

  void back(){
    diffcoin += _score;
    //diffcoin = diffcoin - 100;
    coin = dragcoin + diffcoin + mixcoin + rgbcoin;
    Score = Score + diffcoin;
  }

  Widget _buildToolbar() {
    return Container(
      height: MediaQuery.of(context).size.height/2.5,
      alignment: Alignment.topCenter,
      child: Stack(
        children: <Widget>[
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
                  ); setState(() {
                    back();
                  });
                },
              )
          ), Positioned(
            top: MediaQuery.of(context).size.height/5,
            right: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/3.5,
            child: InkWell(
              onTap: _onTimePressed,
              child: Container(
                height: MediaQuery.of(context).size.width/6,
                width: MediaQuery.of(context).size.width/6,
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(220, 214, 172, 1.0), //timer color
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                alignment: Alignment.center,
                child: _gameOver
                    ? Icon(
                  Icons.exposure_zero,
                  color: Colors.black45,
                  size: 56,
                )
                     :Text(
                  _seconds.toString(),
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width/10,
                    color: Colors.black45,
                  ),
                )
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/5,
            right: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/1.1,
            child: Container(
              height: MediaQuery.of(context).size.width/6,
              width: MediaQuery.of(context).size.width/1.8,
              //margin: EdgeInsets.symmetric(horizontal: 8),
              //padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color.fromRGBO(220, 214, 172, 1.0),//score color
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    //left: 70,
                    child: Container(
                      padding: EdgeInsets.only(left: 42),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '分數',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.width/20,
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            _score.toString(),
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width/20,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    //left: 70,
                    child: Container(
                      padding: EdgeInsets.only(left: 42),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '    ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.width/20,
                              color: Colors.black45,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    //right: 50,
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 42),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '最高紀錄',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.width/20,
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            _bestscore.toString(),
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width/20,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSquare() {
    return SizedBox(
      height: MediaQuery.of(context).size.width,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(2),
        crossAxisCount: _crossAxisCount,
        children: List.generate(
          _crossAxisCount * _crossAxisCount,
              (index) => _buildColorBox(index),
        ),
      ),
    );
  }

  Widget _buildColorBox(int index) {
    return Padding(
      padding: EdgeInsets.all(2),
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: index != _diffIndex ? _color : _diffColor,
        //padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        onPressed: () {
          _onColorPressed(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/2.png"),
                  fit:  BoxFit.fill,
                ),
              ),
              child:Column(
                //mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildToolbar(),
                  _buildSquare(),
                  //SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}