import 'package:flutter/material.dart';
import 'package:gamentic/UI/card_list.dart';
import 'package:gamentic/blocs/game_detail_bloc.dart';
import 'package:gamentic/blocs/platform_details_bloc.dart';
import 'package:gamentic/models/game_detail_model.dart';

class GameDetailPage extends StatefulWidget {

  final int id;
  final String name;

  GameDetailPage(this.id, this.name);

  @override
  _GameDetailPageState createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {

  GameDetail _gameDetail;

  @override
  void initState(){
    gameDetailBloc.fetchallGame(widget.id);
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
        title: Text(widget.name),
        elevation: 0,
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: gameDetailBloc.getGame,
        builder: (context, AsyncSnapshot asyncsnapshot){
          if(asyncsnapshot.hasData){
              return _detailPage(asyncsnapshot);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _detailPage(AsyncSnapshot asyncSnapshot){
    _gameDetail = asyncSnapshot.data;
    return MyCard(
      Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/giphy.gif',
                      image: _gameDetail.backgroundImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(_gameDetail.descriptionRaw,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0
                              ),
                            ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
      );
  }
}