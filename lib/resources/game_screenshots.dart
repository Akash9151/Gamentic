import 'dart:io';

import 'package:gamentic/models/game_screenshots_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GameScreenShotsProviderAPI{


  Future<GameScreenShotsModel> getGameScreenShots(int id) async {

    final String url = 'https://api.rawg.io/api/games/$id/screenshots';


    final response = await http.get(
      url,
      headers: {HttpHeaders.userAgentHeader: "Gamentic"});

    if(response.statusCode == 200){
      return GameScreenShotsModel.fromJson(json.decode(response.body));
    } else{
      throw Exception("Something Went Wrong");
    }

  }

}