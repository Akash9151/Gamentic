import 'dart:async';

import 'package:gamentic/models/game_model.dart';
import 'package:gamentic/resources/repository.dart';

class GameBloc{

  final _repository = Repository();
  StreamController _games = StreamController<GameModel>.broadcast();

  Stream get getGames => _games.stream;

  fetchallgames(String url) async {
    GameModel games = await _repository.fetchAllGames(url);
    _games.sink.add(games);
  }

  void dispose(){
    _games.close();
  }

}

final bloc = GameBloc();