import 'dart:io';

import 'package:gamentic/models/game_detail_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GameDetailsApiProvider{


  Future<GameDetail> getGameDetails(int id) async {

    final String url = 'https://api.rawg.io/api/games/$id';
    print(url);


    final response = await http.get(
      url,
      headers: {HttpHeaders.userAgentHeader: "Gamentic"});

    if(response.statusCode == 200){
      return GameDetail.fromJson(json.decode(response.body));
    } else{
      throw Exception("Something Went Wrong");
    }

  }

}