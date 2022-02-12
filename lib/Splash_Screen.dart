import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'HomeScreen.dart';
import 'home.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key key}) : super(key: key);

  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    rootBundle.loadString('assets/data.json').then((value) {
      (jsonDecode(value)['countries'] as Map).forEach((key, value) {
        if (value['continent'] == 'EU') {
          europe.add(value);
        } else if (value['continent'] == 'AF') {
          africa.add(value);
        } else if (value['continent'] == 'AS') {
          asia.add(value);
        } else if (value['continent'] == 'AN') {
          antarktika.add(value);
        } else if (value['continent'] == 'NA') {
          notrhamerica.add(value);
        } else if (value['continent'] == 'SA') {
          southamerica.add(value);
        } else if (value['continent'] == 'OC') {
          australia.add(value);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SplashScreen(
            backgroundColor: Colors.black,
            seconds: 3,
            navigateAfterSeconds: MyHome(),
            loadingText: Text(
              "Loading...",
              style: TextStyle(color: Colors.white),
            ),
            loaderColor: Colors.indigo,
            image: Image.asset("images/image02.gif"),
            photoSize: 180,
          ),
        ));
  }
}
