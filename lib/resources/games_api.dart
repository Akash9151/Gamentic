import 'dart:io';

import 'package:gamentic/models/game_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GamesApiProvider{

  Future<GameModel> getGames(String url) async {

    final response = await http.get(url, headers: {HttpHeaders.userAgentHeader: "Gamentic"});

    if(response.statusCode == 200){
      return GameModel.fromJson(json.decode(response.body));
    } else{
      throw Exception("Something Went Wrong");
    }

  }

}