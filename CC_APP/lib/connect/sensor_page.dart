import 'dart:async';
import 'dart:convert' show utf8;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '/color_adjust/colorfix.dart';
import '/flutter_color//flutter_hsl/hslcolorpage.dart';
import '/flutter_mix/colormixpage.dart';
import '../home/homepage.dart';

var currentValue, Q, W, E, C;
int calling;
Color next, past;

class SensorPage extends StatefulWidget {
  const SensorPage({Key key, this.device}) : super(key: key);
  final BluetoothDevice device;

  @override
  _SensorPageState createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  // ignore: non_constant_identifier_names
  final String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";

  // ignore: non_constant_identifier_names
  final String CHARACTERISTIC_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
  Stream<List<int>> stream;

  // ignore: deprecated_member_use
  List<double> traceDust = List();

  @override
  void initState() {
    super.initState();
    isReady = false;
    connectToDevice();
  }

  connectToDevice() async {
    if (widget.device == null) {
      _Pop();
      return;
    }

    new Timer(const Duration(seconds: 15), () {
      if (!isReady) {
        disconnectFromDevice();
        _Pop();
      }
    });

    await widget.device.connect();
    discoverServices();
  }

  disconnectFromDevice() {
    if (widget.device == null) {
      _Pop();
      return;
    }

    widget.device.disconnect();
  }

  discoverServices() async {
    if (widget.device == null) {
      _Pop();
      return;
    }

    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == SERVICE_UUID) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            stream = characteristic.value;

            setState(() {
              isReady = true;
            });
          }
        });
      }
    });

    if (!isReady) {
      _Pop();
    }
  }

  Future<bool> _onWillPop() {
    return showDialog(
        context: context,
        builder: (context) =>
            new AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to disconnect device and go back?'),
              actions: <Widget>[
                // ignore: deprecated_member_use
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('No')),
                // ignore: deprecated_member_use
                new FlatButton(
                    onPressed: () {
                      disconnectFromDevice();
                      Navigator.of(context).pop(true);
                    },
                    child: new Text('Yes')),
              ],
            ) ??
            false);
  }

  // ignore: non_constant_identifier_names
  _Pop() {
    Navigator.of(context).pop(true);
  }

  String _dataParser(List<int> dataFromDevice) {
    return utf8.decode(dataFromDevice);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("image/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              child: !isReady
                  ? Center(
                      child: Text(
                        "Waiting...",
                        style: TextStyle(fontSize: 24, color: Colors.redAccent),
                      ),
                    )
                  : Container(
                      child: StreamBuilder<List<int>>(
                        stream: stream,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<int>> snapshot) {
                          if (snapshot.hasError)
                            return Text('Error: ${snapshot.error}');

                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            currentValue = _dataParser(snapshot.data);
                            List<String> currentList = currentValue.split(",");
                            Q = currentList[0];
                            W = currentList[1];
                            E = currentList[2];
                            C = currentList[3];

                            Num(Q, W, E, C);
                            Fix(next);

                            if (calling == 1) {
                              return ColorPage();
                            } else if (calling == 2) {
                              return ColorMixPage();
                            } else {
                              calling = 0;
                              return HomePage();
                            }
                          } else {
                            return Text('Check the stream');
                          }
                        },
                      ),
                    )),
        ),
      ),
    );
  }
}

Num(var red, var green, var blue, var c) {
  var r = int.parse(red);
  var g = int.parse(green);
  var b = int.parse(blue);
  clear = int.parse(c);
  next = Color.fromARGB(255, r, g, b);
}
