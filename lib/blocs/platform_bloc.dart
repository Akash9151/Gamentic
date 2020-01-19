import 'dart:async';

import 'package:gamentic/models/platform_model.dart';
import 'package:gamentic/resources/repository.dart';

class PlatformBloc{

  final _repository = Repository();
  StreamController _platforms = StreamController<PlatformModel>.broadcast();

  Stream get getPlatforms => _platforms.stream;

  fetchallPlatforms() async {
    PlatformModel platformModel = await _repository.fetchAllPlatforms();
    _platforms.sink.add(platformModel);
  }

  void dispose(){
    _platforms.close();
  }

}

final platformBloc = new PlatformBloc();