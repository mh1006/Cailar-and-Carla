import '/videos/links.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HSLLink extends StatefulWidget{
  HSLLink({this.url});
  final String url;
  @override
  _HSLLinkState createState() => _HSLLinkState();

}

class _HSLLinkState extends State<HSLLink> {
  YoutubePlayerController _controller;

  void runYP(){
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
        flags: YoutubePlayerFlags(
      enableCaption: false,
        isLive: false,
    autoPlay: false,
    )
    );
  }
  @override
  void initState(){
    runYP();
    super.initState();
  }
  @override
  void deactivate(){
    _controller.pause();
    super.deactivate();
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  return YoutubePlayerBuilder(
    player: YoutubePlayer(
      controller: _controller,
    ),
    builder: (context,player) {
      return Scaffold(
          body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("image/bg.jpg"),
      fit: BoxFit.cover,
      ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("【凱拉小教室】",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
            SizedBox(height: 40,),
            player,
            SizedBox(height: 40,),
            BacktoButton(),
          ],
        ),
      ));
    });
  }
}