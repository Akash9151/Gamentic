import 'dart:async';

import 'package:gamentic/models/game_detail_model.dart';
import 'package:gamentic/resources/repository.dart';

class GameDetailBloc{

  final _repository = Repository();
  StreamController _gameDetailBloc = StreamController<GameDetail>.broadcast();

  Stream get getGame => _gameDetailBloc.stream;

  fetchallGame(int id) async {
    GameDetail gameDetail = await _repository.fetchGameDetail(id);
    _gameDetailBloc.sink.add(gameDetail);
  }

  void dispose(){
    _gameDetailBloc.close();
  }

}

final gameDetailBloc = new GameDetailBloc();