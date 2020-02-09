import 'package:flutter/material.dart';
import 'package:gamentic/UI/card_list.dart';
import 'package:gamentic/UI/game_detail_page.dart';
import 'package:gamentic/blocs/games_bloc.dart';
import 'package:gamentic/models/game_model.dart';

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  String  url  = "https://api.rawg.io/api/games";

  ScrollController _controller;
  GameModel _gameModel;

  @override
  void initState() {
    bloc.fetchallgames(url);
    _controller = new ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }


  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        // Reached At BOTTOM
        if(_gameModel.next != null){
          url = _gameModel.next;
          bloc.fetchallgames(url);
          _controller.jumpTo(_controller.offset - (260 * _gameModel.results.length));
        }
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        // Reached At Top
        if(_gameModel.previous != null){
          url = _gameModel.previous;
          bloc.fetchallgames(url);
          _controller.jumpTo(_controller.offset + (260 * _gameModel.results.length));
        }
      });
    }
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
      ),
      body: StreamBuilder(
        stream: bloc.getGames,
        builder: (context, AsyncSnapshot asyncSnapshot){
           if(asyncSnapshot.hasData){
                    return listGames(asyncSnapshot);
                  } else if(asyncSnapshot.hasError){
                      return Center(child: Text("Something Went Wrong"),);
                  } else {
                      return Center(
                          child: CircularProgressIndicator(),
                       );
                   }
        },
      ),
    );
  }

  Widget listGames(AsyncSnapshot snapshot) {

    _gameModel = snapshot.data;

    return ListView.separated(
      controller: _controller,
      itemCount: _gameModel.results.length,
      separatorBuilder: (context, int index){
        return SizedBox(
          height: 20,
        );
      },
      itemBuilder: (context, int index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new GameDetailPage(_gameModel.results[index].id, _gameModel.results[index].name)));
          },
                child: MyCard(
            Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 250,
                      child: Stack(
                        children: <Widget>[
                          Center(child: CircularProgressIndicator()),
                          Center(
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/transparent.png',
                              height: 250,
                              image: _gameModel.results[index].backgroundImage,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(_gameModel.results[index].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                            ),
                          ),
                      ),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
