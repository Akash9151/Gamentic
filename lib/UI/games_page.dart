import 'package:flutter/material.dart';
import 'package:gamentic/UI/Widgets/game_list.dart';
import 'package:gamentic/UI/custom_search_delegate.dart';
import 'package:gamentic/blocs/games_bloc.dart';
import 'package:gamentic/models/game_model.dart';

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  String url = "https://api.rawg.io/api/games";

  ScrollController _controller;

  List<Results> _list;

  @override
  void initState() {
    bloc.fetchallgames(url);
    _list = List();
    super.initState();
  }

  

  ThemeData themeData = new ThemeData(
    canvasColor: Color(0xff015668),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeData.canvasColor,
      appBar: AppBar(
        backgroundColor: themeData.canvasColor,
        title: Text("Games"),
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              }),
        ],
      ),
      body: StreamBuilder<GameModel>(
        stream: bloc.getGames,
        builder: (context, AsyncSnapshot<GameModel> asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            _list.addAll(asyncSnapshot.data.results);
            return GameList(
              results: _list,
              onEnd: (){
                bloc.fetchallgames(asyncSnapshot.data.next);
              },
            );
          } else if (asyncSnapshot.hasError) {
            return Center(
              child: Text("Something Went Wrong"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
