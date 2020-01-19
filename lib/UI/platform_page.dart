import 'package:flutter/material.dart';
import 'package:gamentic/UI/platform_detail_page.dart';
import 'package:gamentic/blocs/platform_bloc.dart';
import 'package:gamentic/models/platform_model.dart';
import 'card_list.dart';

class PlatformPage extends StatefulWidget {
  @override
  _PlatformPageState createState() => _PlatformPageState();
}

class _PlatformPageState extends State<PlatformPage> {

  PlatformModel _platformModel;

  @override
  void initState() {
    platformBloc.fetchallPlatforms();
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
        title: Text("Platforms"),
        elevation: 0,
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: platformBloc.getPlatforms,
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

    _platformModel = snapshot.data;

    return new ListView.separated(
      itemCount: _platformModel.results.length,
      separatorBuilder: (context, int index){
        return SizedBox(
          height: 20,
        );
      },
      itemBuilder: (context, int index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new PlatformDetailPage(_platformModel.results[index].id.toString(), _platformModel.results[index].name)));
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
                              image: _platformModel.results[index].imageBackground,
                              fit: BoxFit.cover,
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
                      child: Text(_platformModel.results[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                          ),
                        ),
                    ),
                  ),
                ),
              ],
            )
            )
        );
      },
    );
  }
}