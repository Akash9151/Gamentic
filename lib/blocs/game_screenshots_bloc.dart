import 'dart:async';

import 'package:gamentic/models/game_screenshots_model.dart';
import 'package:gamentic/resources/repository.dart';

class GameScreenShotsBloc{

  final _repository = Repository();
  StreamController _games = StreamController<GameScreenShotsModel>.broadcast();

  Stream get getGamesScreenShots => _games.stream;

  fetchallgamesscreenshots(int id) async {
    GameScreenShotsModel gamesScreenShot = await _repository.fetchGameScreenShots(id);
    _games.sink.add(gamesScreenShot);
  }

  void dispose(){
    _games.close();
  }

}

final gameScreenShotBloc = GameScreenShotsBloc();