import 'package:flutter/material.dart';
import 'package:gamentic/UI/games_page.dart';
import 'package:gamentic/UI/platform_page.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  int _cIndex = 0;

  List<Widget> tabs = [
    Myapp(),
    PlatformPage()
  ];

  ThemeData themeData = new ThemeData(
    canvasColor: Color(0xff015668),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_cIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeData.canvasColor,
        currentIndex: _cIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.games, color: Colors.white,),
            title: new Text('Games',)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.desktop_mac, color: Colors.white,),
            title: new Text('Platforms')
          ),
        ],
        onTap: (index){
            setState(() {
              if(_cIndex == 0){
              _cIndex = 1;
            }else{
              _cIndex = 0;
            }
            });
        },
      )
    );
  }
}