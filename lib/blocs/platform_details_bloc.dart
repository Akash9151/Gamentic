import 'dart:async';

import 'package:gamentic/models/platform_detail_model.dart';
import 'package:gamentic/resources/repository.dart';

class DetailBloc{

  final _repository = Repository();
  StreamController _platformsDetail = StreamController<PlatformDetail>.broadcast();

  Stream get getPlatforms => _platformsDetail.stream;

  fetchallPlatforms(String id) async {
    PlatformDetail platformDetail = await _repository.fetchPlatformDetail(id);
    _platformsDetail.sink.add(platformDetail);
  }

  void dispose(){
    _platformsDetail.close();
  }

}

final detailBloc = new DetailBloc();