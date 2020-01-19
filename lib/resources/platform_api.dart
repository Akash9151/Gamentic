import 'package:gamentic/models/platform_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class PlatformApiProvider{

  final String url = 'https://api.rawg.io/api/platforms';

  Future<PlatformModel> getPlatforms() async {

    final response = await http.get(url, headers: {HttpHeaders.userAgentHeader: "Gamentic"});

    if(response.statusCode == 200){
      return PlatformModel.fromJson(json.decode(response.body));
    } else{
      throw Exception("Something Went Wrong");
    }

  }

}