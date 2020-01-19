import 'package:gamentic/models/game_detail_model.dart';
import 'package:gamentic/models/game_model.dart';
import 'package:gamentic/models/platform_detail_model.dart';
import 'package:gamentic/models/platform_model.dart';
import 'package:gamentic/resources/game_detail_api.dart';
import 'package:gamentic/resources/games_api.dart';
import 'package:gamentic/resources/platform_api.dart';
import 'package:gamentic/resources/platform_detail_api.dart';

class Repository{

  final _gameapiprovider = new GamesApiProvider();
  final _platformapiprovider = new PlatformApiProvider();
  final _platformDetail = new PlatformDetailsApiProvider();
  final _gameDetail = new GameDetailsApiProvider();

  Future<GameModel> fetchAllGames(String url) => _gameapiprovider.getGames(url);
  Future<PlatformModel> fetchAllPlatforms() => _platformapiprovider.getPlatforms();
  Future<PlatformDetail> fetchPlatformDetail(String id) => _platformDetail.getPlatformsDetails(id);
  Future<GameDetail> fetchGameDetail(int id) => _gameDetail.getGameDetails(id);

}