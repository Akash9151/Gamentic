import 'package:flutter/material.dart';
import 'package:gamentic/models/game_model.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../card_list.dart';
import '../game_detail_page.dart';

class GameList extends StatelessWidget {
  final List<Results> results;
  final VoidCallback onEnd;

  GameList({@required this.results, @required this.onEnd});

  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
      onEndOfPage: onEnd,
      child: ListView.separated(
        itemCount: results.length,
        separatorBuilder: (context, int index) {
          return SizedBox(
            height: 20,
          );
        },
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new GameDetailPage(
                          results[index].id,
                          results[index].name)));
            },
            child: MyCard(Column(
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
                            image: results[index].backgroundImage,
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
                      child: Text(
                        results[index].name,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
