import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../gamebutton.dart';
import '../gamepage.dart';
import 'Box.dart';
import 'gamesort.dart';
import '/home/homepage.dart';

class Smon extends StatefulWidget {
  Smon({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _SmonState createState() => _SmonState();
}


class _SmonState extends State<Smon> {

  bool _gameOver = false;//
  bool time_run = false;

  int _time = 30;
  int _tu=0;

  int _score = 300;
  int _bestscore = 0;//
  int _lscore = 0;//
  int _minus=25;

  int _start=0;
  int _win=0;

  List _RGB=[25,50,75,100,125,150,175,200,225,250];
  int _i=0; //1-10
  int _f=0;
  int _s=0;
  int _rgb=1;



  int _slot;

  initState(){
    super.initState();
    _updateData();
    _shuffle();
  }

  _shuffle(){
    _RGB.shuffle();
    _rgb =Random().nextInt(3)+1;
    _f=Random().nextInt(256);
    _s=Random().nextInt(256);


    print("1 G:$_f B:$_s _RGB[_i]:${_RGB[_i]} _I:$_i");
    setState((){
      //_RGB.shuffle();
      Color.fromARGB( 255, _RGB[_i], _f, _s);
      //MyColor
    });
  }
    Color Myrgb(){
      //return Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
      if(_rgb==1){
        print("1 G:$_f B:$_s");
        return Color.fromARGB( 255, 255, _f, _s);
      }
      else if(_rgb==2){
        print("2 R:$_f B:$_s");
        return Color.fromARGB( 255, _f,255, _s);
      }
      else if(_rgb==3){
        print("3 R:$_f G:$_s");
        return Color.fromARGB( 255, _f, _s, 255);

      }

  }

  _checkWin(){
    //List<double> lum=_colors.map((c) => c.computeLuminance()).toList();
    //print(_colors.map((c) => c.computeLuminance()).toList());
    bool success=true;
    for( int i=0;i<_RGB.length-1;i++){
      if(_RGB[i]<_RGB[i+1]){
        success=false;
        break;
      }
    }
    print(success?"win":"");
    if(success==true) {
      time_run = false;
      _win=1;
      _lscore=_score;
      sscore=sscore+_score;
      Score=Score+sscore;
    }
  }

  void _run() {
    _setTimer();
    setState(() {
      _score = 1050;
      _time = 30;
      _start=1;
      _win=0;
    });
    _updateData();
  }

  void _restart() {
    _gameOver = false;
    time_run = false;
    setState(() {
      _start=0;
      _win=0;
    });
    _updateData();
  }

  void _setTimer() {
    if (time_run){
      time_run = false;
    }
    else{
      time_run = true;
    }
    Timer.periodic(
      const Duration(seconds: 1),
          (Timer t) {
        if (_time < 1 || time_run == false) {
          t.cancel();
          _setGameOver();
        } else {
          setState(() {
            _time --;
            _score=_score-_minus;

          });
        }
      },
    );
  }

  _updateData() async {
    var prefs = await SharedPreferences.getInstance();
    var bestscore = prefs.getInt('BEST') ?? 0;

    if (bestscore < _lscore) {
      await prefs.setInt('BEST', _lscore);
      bestscore = _lscore;
    }

    setState(() {
      _bestscore = bestscore;
    });
  }


  void _setGameOver() {
    setState(() {
      _gameOver = true;
    });
    if(_time<1)_tu=1;
    else _tu=0;
    if(_gameOver)_win=1;
    else _win=0;
  }

  final _globalKey2 = GlobalKey();
  double _offset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      _start !=1?Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/db.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            color: Color.fromARGB(255, 254, 228, 172),
            onPressed: (){
              _shuffle();
              _run();

            },
            child: Text("開始!",
              style: TextStyle(fontSize: 20, color: Colors.black),
            )
        ),
      ):Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("image/db.png"),
              fit: BoxFit.fill,
            ),
          ),
          child:
          _win !=1?Center(
            child: Column(
              children: [
                SizedBox(height: phoneheight/5.5,),
                /*Container(
                  color: Color.fromARGB(255, 254, 228, 172),
                  child: _rgb ==1 ?Text("Sort R G=$_f B=$_s",style: TextStyle(fontSize: 20))
                      :_rgb ==2 ?Text("Sort G R=$_f G=$_s",style: TextStyle(fontSize: 20))
                      :Text("Sort B R=$_f G=$_s",style: TextStyle(fontSize: 20)),

                ),*/
                //Text("$_rgb G:$_f B:$_s _RGB[_i]:${_RGB[_i]} _I:$_i", style: TextStyle(fontSize: 20)),
                Text('$_time',
                  style: TextStyle(
                    fontFamily: 'Mononoki',
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),),
                //Text('$_score', style: TextStyle(fontSize: 20)),

                const SizedBox(height: 20),
                Container(
                  height: Box2.height-Box2.margin*2,
                  width: Box2.width-Box2.margin*2,
                  decoration: BoxDecoration(
                    color :Myrgb(),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child:Icon(Icons.lock_outline,color: Colors.white,),
                ),
                SizedBox(height: Box2.margin*2),
                Expanded (
                  child: Listener(
                    onPointerMove: (event){
                      final y=event.position.dy-_offset;
                      //print(y);
                      if(y>(_slot+1)* Box2.height){
                        if(_slot==_RGB.length-1)return;
                        setState(() {
                          final c=_RGB[_slot];
                          _RGB[_slot]=_RGB[_slot+1];
                          _RGB[_slot+1]= c;
                          _slot++;
                        });
                      }else if(y<(_slot)* Box2.height){
                        if(_slot==0)return;
                        setState(() {
                          final c=_RGB[_slot];
                          _RGB[_slot]=_RGB[_slot-1];
                          _RGB[_slot-1]= c;
                          _slot--;
                        });
                      }
                    },

                    child: SizedBox(
                      width: Box2.width,
                      child :Stack(
                        key: _globalKey2,
                        children: List.generate(_RGB.length,(i){
                          return Box2(
                            color :_rgb ==1 ?Color.fromARGB( 255, _RGB[i], _f, _s):_rgb == 2?Color.fromARGB( 255, _f, _RGB[i], _s):Color.fromARGB( 255, _f, _s, _RGB[i]),
                            x:0,
                            y: i*Box2.height,
                            onDrag:(_){
                              final index = _RGB.indexOf(_RGB[i]);
                              final renderBox=(_globalKey2.currentContext.findRenderObject()as RenderBox);
                              _offset=renderBox.localToGlobal(Offset.zero).dy;
                              print("onDrag $index sh $_offset");
                              print( _RGB);
                              _slot=index;
                            },
                            onEnd: _checkWin,

                          );
                        }),
                      ),
                    ),
                  ),
                ),
                /*SizedBox(
                  height: 30.0,
                  child: FloatingActionButton(
                    backgroundColor: Color.fromARGB(255, 254, 228, 172),
                    onPressed: (){
                      _shuffle();
                    },
                    child: Icon(Icons.refresh),
                  ),
                ),*/
                Container(
                  padding: EdgeInsets.only(bottom: 130),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      color: Color.fromARGB(255, 254, 228, 172),
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SortPage(),
                            maintainState: false,
                          ),
                        );
                      },
                      child:Icon(
                        Icons.backspace
                      )
                  ),
                ),
              ],
            ),

          ):Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Visibility(
                  visible: _tu != 1? false:true,
                  child: Text('時間到!', style: TextStyle(color: Colors.redAccent,fontSize: 30)),
                ),
                //Text('Time:$_time', style: TextStyle(fontSize: 30)),
                Text('分數:$_score', style: TextStyle(fontSize: 30)),
                SizedBox(height: 50),
                Text('最高紀錄:$_bestscore', style: TextStyle(fontSize: 20)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 50),
                    RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        color: Color.fromARGB(255, 254, 228, 172),
                        onPressed:(){
                          _restart();
                        },
                        child:Text(
                          "再玩一次",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        )
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        color: Color.fromARGB(255, 254, 228, 172),
                        onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SortPage(),
                              maintainState: false,
                            ),
                          );
                        },
                        child:Text(
                          "選擇難度",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        )
                    ),
                    SizedBox(height: 20),
                    GamepageB(),
                  ],
                )
              ],
            ),
          )


      ),
      // This trailing comma makes auto-formatting nicer for build methods.



    );
  }
}
