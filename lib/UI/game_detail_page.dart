import 'package:flutter/material.dart';
import 'package:gamentic/UI/card_list.dart';
import 'package:gamentic/blocs/game_detail_bloc.dart';
import 'package:gamentic/blocs/game_screenshots_bloc.dart';
import 'package:gamentic/models/game_detail_model.dart';
import 'package:gamentic/models/game_screenshots_model.dart';
import 'platform_detail_page.dart';
import 'package:url_launcher/url_launcher.dart';

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
  void initState() {
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
            children: <Widget>[
              Container(
                height: 300,
                child: StreamBuilder(
                  stream: gameScreenShotBloc.getGamesScreenShots,
                  builder: (context, AsyncSnapshot asyncsnapshot) {
                    if (asyncsnapshot.hasData) {
                      return _sliderForImage(asyncsnapshot);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              Container(
                child: StreamBuilder(
                  stream: gameDetailBloc.getGame,
                  builder: (context, AsyncSnapshot asyncsnapshot) {
                    if (asyncsnapshot.hasData) {
                      _gameDetail = asyncsnapshot.data;
                      return _detailPage(asyncsnapshot);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }

  Widget _sliderForImage(AsyncSnapshot asyncSnapshot) {
    _gameScreenShotsModel = asyncSnapshot.data;
    print(asyncSnapshot.data);

    return SingleChildScrollView(
      child: Container(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _gameScreenShotsModel.results.length,
          itemBuilder: (context, int index) {
            return MyCard(
              Center(
                child: FadeInImage.assetNetwork(
                  height: 300,
                  width: MediaQuery.of(context).size.width - 50,
                  placeholder: 'assets/transparent.png',
                  image: _gameScreenShotsModel.results[index].image,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _detailPage(AsyncSnapshot asyncSnapshot) {
    return Column(
      children: <Widget>[
        MyCard(Center(
            child: Container(
          height: 50.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Game Rating: ",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                Text(
                  _gameDetail.rating.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                )
              ],
            ),
          ),
        ))),
        MyCard(Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Platforms",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                child: Container(
                  height: 70.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _gameDetail.platforms.length,
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => PlatformDetailPage(
                                      _gameDetail.platforms[index].platform.id
                                          .toString(),
                                      _gameDetail
                                          .platforms[index].platform.name)));
                        },
                        child: MyCard(
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                _gameDetail.platforms[index].platform.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        )),
        MyCard(Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Text(
                  "Description",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  _gameDetail.descriptionRaw,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            ),
          ),
        )),
        MyCard(Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Developers",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0 * _gameDetail.developers.length,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _gameDetail.developers.length,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => PlatformDetailPage(
                                    _gameDetail.platforms[index].platform.id
                                        .toString(),
                                    _gameDetail
                                        .platforms[index].platform.name)));
                      },
                      child: MyCard(
                        Center(
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(
                                      "${_gameDetail.developers[index].imageBackground}"),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text(
                                  _gameDetail.developers[index].name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              )),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )),
        MyCard(Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Stores",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                child: Container(
                  height: 270.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _gameDetail.stores.length,
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _launchURL(_gameDetail.stores[index].url);
                        },
                        child: MyCard(
                          Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  
                                  Center(
                                    child: FadeInImage.assetNetwork(
                                      placeholder: 'assets/transparent.png',
                                      height: 200.0,
                                      image: _gameDetail
                                          .stores[index].store.imageBackground,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    _gameDetail.stores[index].store.name,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
