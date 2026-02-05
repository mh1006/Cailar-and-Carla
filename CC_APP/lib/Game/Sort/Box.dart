
import 'package:flutter/cupertino.dart';

class Box extends StatelessWidget {
  static const width = 160.0;
  static const height = 40.0;
  static const margin = 2.0;

  final Color color;
  final double x,y;
  final Function(Color ) onDrag;
  final Function( ) onEnd;

  Box({
    @required this.color,
    @required this.x,
    @required this.y,
    @required this.onDrag,
    @required this.onEnd,
    Key key,
  }):super(key: ValueKey(color),);

  @override
  Widget build(BuildContext context) {
    final container = Container(
      height: height-margin*2,
      width: width-margin*2,
      decoration: BoxDecoration(
        color : color,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
    return AnimatedPositioned(
      duration :Duration(milliseconds :100),
      top :y,
      left :x,
      child: Draggable(
        onDragStarted:()=>onDrag(color),
        onDragEnd: (_)=> onEnd(),
        child: container,
        feedback: container,
        childWhenDragging: Visibility(
          visible: false,
          child: container,
        ),
      ),
    );
  }
}
class Box2 extends StatelessWidget {
  static const width =150.0;
  static const height =35.0;
  static const margin =2.0;

  final Color color;
  final double x,y;
  final Function(Color ) onDrag;
  final Function( ) onEnd;

  Box2({
    @required this.color,
    @required this.x,
    @required this.y,
    @required this.onDrag,
    @required this.onEnd,
    Key key,
  }):super(key: ValueKey(color),);

  @override
  Widget build(BuildContext context) {
    final container = Container(
      height: height-margin*2,
      width: width-margin*2,
      decoration: BoxDecoration(
        color : color,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
    return AnimatedPositioned(
      duration :Duration(milliseconds :100),
      top :y,
      left :x,
      child: Draggable(
        onDragStarted:()=>onDrag(color),
        onDragEnd: (_)=> onEnd(),
        child: container,
        feedback: container,
        childWhenDragging: Visibility(
          visible: false,
          child: container,
        ),
      ),
    );
  }
}