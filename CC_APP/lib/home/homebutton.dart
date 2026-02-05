import '/videos/links.dart';

import '/Game/gamepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '/flutter_color/flutter_hsl/hslcolorpage.dart';
import '../color recognition.dart';
import '../connect/bluetooth.dart';
import '../connect/sensor_page.dart';
import '../flutter_mix/colormixpage.dart';
import 'homepage.dart';
import 'instruction.dart';
import 'problem.dart';

class SettingButton extends StatelessWidget {
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return IconButton(
      icon: Icon(
        Icons.settings,
        size: MediaQuery.of(context).size.width / 10,
        color: Color.fromARGB(255, 139, 136, 128),
      ),
      onPressed: () async {
        final ConfirmAction action = await confirmDialog(context);
        //print("你選擇：$action");
      },
    );
  }
}

class RGBButton extends StatelessWidget {
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return CircleAvatar(
        radius: MediaQuery.of(context).size.width / 8,
        backgroundColor: Color.fromRGBO(255, 226, 128, 1),
        child: IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(Icons.auto_fix_high,
              size: MediaQuery.of(context).size.width / 8,
              color: Color.fromRGBO(227, 170, 120, 1.0)),
          onPressed: () {
            calling = 1;
            !isReady
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OfflineColorPage(),
                      maintainState: false,
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ColorPage(),
                      maintainState: false,
                    ),
                  );
          },
        ));
  }
}

class MixButton extends StatelessWidget {
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return CircleAvatar(
        radius: MediaQuery.of(context).size.width / 8,
        backgroundColor: Color.fromRGBO(255, 226, 128, 1),
        child: IconButton(
          padding: EdgeInsets.only(right: 10, bottom: 2),
          icon: Icon(Icons.add_circle,
              size: MediaQuery.of(context).size.width / 8,
              color: Color.fromRGBO(227, 170, 120, 1.0)),
          onPressed: () {
            calling = 2;
            !isReady
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OfflineMixPage(),
                      maintainState: false,
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ColorMixPage(),
                      maintainState: false,
                    ),
                  );
          },
        ));
  }
}

class ARButton extends StatelessWidget {
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return CircleAvatar(
        radius: MediaQuery.of(context).size.width / 8,
        backgroundColor: Color.fromRGBO(255, 226, 128, 1),
        child: IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(Icons.video_library_rounded,
              size: MediaQuery.of(context).size.width / 8,
              color: Color.fromRGBO(227, 170, 120, 1.0)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LinkPage(),
                maintainState: false,
              ),
            );
          },
        ));
  }
}

class GameButton extends StatelessWidget {
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return CircleAvatar(
        radius: MediaQuery.of(context).size.width / 8,
        backgroundColor: Color.fromRGBO(255, 226, 128, 1),
        child: IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(
            Icons.videogame_asset,
            size: MediaQuery.of(context).size.width / 8,
            color: Color.fromRGBO(227, 170, 120, 1.0),
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
        ));
  }
}

class ActiveButton extends StatelessWidget {
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return CircleAvatar(
        radius: MediaQuery.of(context).size.width / 8,
        backgroundColor: Color.fromRGBO(255, 226, 128, 0.19),
        child: IconButton(
          padding: EdgeInsets.only(right: 10, bottom: 2),
          icon: Icon(FontAwesome5Solid.crown,
              size: MediaQuery.of(context).size.width / 10,
              color: Color.fromRGBO(227, 170, 120, 0.19)),
          onPressed: () {
          },
        ));
  }
}

class VSButton extends StatelessWidget {
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return CircleAvatar(
        radius: MediaQuery.of(context).size.width / 8,
        backgroundColor: Color.fromRGBO(255, 226, 128, 0.19),
        child: IconButton(
          padding: EdgeInsets.only(right: 10, bottom: 2),
          icon: Icon(FontAwesome5Solid.user_friends,
              size: MediaQuery.of(context).size.width / 10,
              color: Color.fromRGBO(227, 170, 120, 0.19)),
          onPressed: () {

          },
        ));
  }
}

enum ConfirmAction { ACCEPT, CANCEL }

Future<ConfirmAction> confirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: true, //控制點擊對話框以外的區域是否隱藏對話框
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('設定'),
        //content: const Text('內容訊息'),
        children: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            child: Text('操作說明'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InstructionPage(),
                    maintainState: false,
                  ));
            },
          ),
          // ignore: deprecated_member_use
          FlatButton(
            child: const Text('問題回報'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProblemPage(),
                    maintainState: false,
                  ));
            },
          )
        ],
      );
    },
  );
}

class wifiButton extends StatelessWidget {
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return IconButton(
      icon: Icon(
        Icons.bluetooth,
        size: MediaQuery.of(context).size.width / 10,
        color: Color.fromARGB(255, 139, 136, 128),
      ),
      onPressed: () {
        calling = 0;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FlutterBlueApp()));
      },
    );
  }
}
