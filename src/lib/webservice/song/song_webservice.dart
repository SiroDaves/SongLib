import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/base/song.dart';
import 'song_service.dart';

part 'song_webservice.g.dart';

@dev
@prod
@Singleton(as: SongService)
@RestApi()
abstract class SongWebService extends SongService {
  @factoryMethod
  factory SongWebService(Dio dio) = _SongWebService;

  @override
  @GET('/Song')
  Future<List<Song>> getSongs();
}
