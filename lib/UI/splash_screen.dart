import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamentic/UI/games_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Myapp()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  ThemeData themeData = new ThemeData(
    canvasColor: Color(0xff015668),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeData.canvasColor,
      body: Center(
        child: Text("Gamentic",style: TextStyle(
                              color: Colors.white,
                              fontSize: 70.0
                            ),),
      ),      
    );
  }
}
