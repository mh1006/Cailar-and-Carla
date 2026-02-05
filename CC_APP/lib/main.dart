import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home/homepage.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));
  });
}
