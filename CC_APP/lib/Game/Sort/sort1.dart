import 'dart:async';
import 'dart:math';
import '../gamebutton.dart';
import '/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Box.dart';
import 'gamesort.dart';
import '../gamepage.dart';

class Seasy extends StatefulWidget {
  Seasy({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _SeasyState createState() => _SeasyState();
}


class _SeasyState extends State<Seasy> {

  bool _gameOver = false;//
  bool time_run = false;

  int _time = 30;
  int _tu=0;

  int _score = 350;
  int _bestscore = 0;//
  int _lscore = 350;//

  int _start=0;
  int _win=0;

  var _color= Colors.blue;

  List <Color> _colors =[];
  int _slot;

  initState(){
    super.initState();
    _updateData();
    _shuffle();
  }

  _shuffle(){
    _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    _colors=List.generate(8, (index)=>_color[(index+1)*100]);
    setState(()=>_colors.shuffle());
  }

  _checkWin(){
    List<double> lum=_colors.map((c) => c.computeLuminance()).toList();
    //print(_colors.map((c) => c.computeLuminance()).toList());
    bool success=true;
    for( int i=0;i<lum.length-1;i++){
      if(lum[i]>lum[i+1]){
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
      _score = 350;
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
            _score=_score-10;

          });
        }
      },
    );
  }

  void _updateData() async {
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


  final _globalKey = GlobalKey();
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
                SizedBox(height: phoneheight/5,),
                Text('$_time',
                  style: TextStyle(
                    fontFamily: 'Mononoki',
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),),
                //Text('$_score', style: TextStyle(fontSize: 20)),


                const SizedBox(height: 20,),
                Container(
                  height: Box.height-Box.margin*2,
                  width: Box.width-Box.margin*2,
                  decoration: BoxDecoration(
                    color : _color[900],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child:Icon(Icons.lock_outline,color: Colors.white,),
                ),
                SizedBox(height: Box.margin*2),
                Expanded (
                  child: Listener(
                    onPointerMove: (event){
                      final y=event.position.dy-_offset;
                      //print(y);
                      if(y>(_slot+1)* Box.height){
                        if(_slot==_colors.length-1)return;
                        setState(() {
                          final c=_colors[_slot];
                          _colors[_slot]=_colors[_slot+1];
                          _colors[_slot+1]= c;
                          _slot++;
                        });
                      }else if(y<(_slot)* Box.height){
                        if(_slot==0)return;
                        setState(() {
                          final c=_colors[_slot];
                          _colors[_slot]=_colors[_slot-1];
                          _colors[_slot-1]= c;
                          _slot--;
                        });
                      }
                    },

                    child: SizedBox(
                      width: Box.width,
                      child :Stack(
                        key: _globalKey,
                        children: List.generate(_colors.length,(i){
                          return Box(
                            color :_colors[i],
                            x:0,
                            y: i*Box.height,
                            onDrag:(Color color){
                              final index = _colors.indexOf(color);
                              final renderBox=(_globalKey.currentContext.findRenderObject()as RenderBox);
                              _offset=renderBox.localToGlobal(Offset.zero).dy;
                              //print("onDrag $index sh $_offset");
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
                ),
                SizedBox(
                  height: 40.0,
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
