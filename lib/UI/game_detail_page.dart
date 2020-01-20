import 'package:flutter/material.dart';
import 'package:gamentic/UI/card_list.dart';
import 'package:gamentic/blocs/game_detail_bloc.dart';
import 'package:gamentic/blocs/game_screenshots_bloc.dart';
import 'package:gamentic/models/game_detail_model.dart';
import 'package:gamentic/models/game_screenshots_model.dart';

class GameDetailPage extends StatefulWidget {

  final int id;
  final String name;

  GameDetailPage(this.id, this.name);

  @override
  _GameDetailPageState createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {

  GameDetail _gameDetail;
  GameScreenShotsModel _gameScreenShotsModel;

  @override
  void initState(){
    gameScreenShotBloc.fetchallgamesscreenshots(widget.id);
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
      body: SingleChildScrollView(
            child: Column(
            
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              StreamBuilder(
                stream: gameScreenShotBloc.getGamesScreenShots,
                builder: (context, AsyncSnapshot asyncsnapshot){
                  if(asyncsnapshot.hasData){
                      return _sliderForImage(asyncsnapshot);
                  }else{
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              StreamBuilder(
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
            ],
          ),
      ),
      );
  }

  Widget _sliderForImage(AsyncSnapshot asyncSnapshot){
    _gameScreenShotsModel = asyncSnapshot.data;
    print(asyncSnapshot.data);

    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _gameScreenShotsModel.results.length,
        itemBuilder: (context, int index){
          return MyCard(
            Stack(
              children: <Widget>[
                Center(child: CircularProgressIndicator(),),
                Center(
                      child: FadeInImage.assetNetwork(
                        height: 300,  
                        width: MediaQuery.of(context).size.width - 50,
                        placeholder: 'assets/transparent.png',
                        image: _gameScreenShotsModel.results[index].image,
                        fit: BoxFit.cover,
                        ),
                      ),
              ],
            ),
          );
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