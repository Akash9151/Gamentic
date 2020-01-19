import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {

  final Widget _child;

  MyCard(this._child);

  final ThemeData themeData = new ThemeData(
    canvasColor: Color(0xff015668),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: themeData.canvasColor.withOpacity(00),
            child: _child
          ),
        );
  }
}