import 'package:cc_success/connect/sensor_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/connect/bluetooth.dart';
import '/flutter_mix/colormixpage.dart';
import '/home/homepage.dart';
import 'flutter_hsl/hslcolorpage.dart';

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Color.fromRGBO(255, 226, 128, 1),
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(), maintainState: false));
        });
  }
}

class AOnlineButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromRGBO(255, 226, 128, 1),
      child: Icon(Icons.bluetooth),
      onPressed: () {
        calling=1;
        !isReady
            ? Navigator.push(context,
                MaterialPageRoute(builder: (context) => FlutterBlueApp()))
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ColorPage(),
                  maintainState: false,
                ),
              );
      },
    );
  }
}

class COnlineButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromRGBO(255, 226, 128, 1),
      child: Icon(Icons.bluetooth),
      onPressed: () {
        calling=2;
        !isReady
            ? Navigator.push(context,
            MaterialPageRoute(builder: (context) => FlutterBlueApp()))
            : Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ColorMixPage(),
            maintainState: false,
          ),
        );
      },
    );
  }
}

class AOfflineButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromRGBO(255, 226, 128, 1),
      child: Icon(Icons.bluetooth_disabled),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OfflineColorPage(),
            maintainState: false,
          ),
        );
      },
    );
  }
}

class COfflineButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromRGBO(255, 226, 128, 1),
      child: Icon(Icons.bluetooth_disabled),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OfflineMixPage(),
            maintainState: false,
          ),
        );
      },
    );
  }
}
