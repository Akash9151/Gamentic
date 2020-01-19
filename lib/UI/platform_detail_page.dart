import 'package:flutter/material.dart';
import 'package:gamentic/UI/card_list.dart';
import 'package:gamentic/blocs/platform_details_bloc.dart';
import 'package:gamentic/models/platform_detail_model.dart';

class PlatformDetailPage extends StatefulWidget {

  final String id;
  final String name;

  PlatformDetailPage(this.id, this.name);

  @override
  _PlatformDetailPageState createState() => _PlatformDetailPageState();
}

class _PlatformDetailPageState extends State<PlatformDetailPage> {

  PlatformDetail _platformDetail;

  @override
  void initState(){
    detailBloc.fetchallPlatforms(widget.id);
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
        stream: detailBloc.getPlatforms,
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
    _platformDetail = asyncSnapshot.data;
    return MyCard(
      Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/giphy.gif',
                      image: _platformDetail.imageBackground,
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
                          child: Text(_platformDetail.description,
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