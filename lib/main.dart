import 'package:dsc_world/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Splash_Screen.dart';
import 'home.dart';

var b = Colors.black54;
var w = Colors.white;


color() {
  b = b == Colors.black54 ? Colors.white : Colors.black54;
  w = w == Colors.white ? Colors.black54 : Colors.white;
}

main() => runApp(Splash_Screen());

class Dsc_World extends StatelessWidget {
  const Dsc_World({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dsc_World",
      //debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}
