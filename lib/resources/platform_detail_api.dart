import 'package:gamentic/models/platform_detail_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class PlatformDetailsApiProvider{


  Future<PlatformDetail> getPlatformsDetails(String id) async {

    final String url = 'https://api.rawg.io/api/platforms/$id';


    final response = await http.get(url, headers: {HttpHeaders.userAgentHeader: "Gamentic"});

    if(response.statusCode == 200){
      return PlatformDetail.fromJson(json.decode(response.body));
    } else{
      throw Exception("Something Went Wrong");
    }

  }

}