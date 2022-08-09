import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/webservice/songs_response.dart';
import '../../util/api/api_constants.dart';
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
  @GET(ApiConstants.song)
  Future<SongsResponse> getSongsResponse(
    @Query('where') String where, {
    @Query('order') String order = 'songNo',
    @Query('limit') int limit = 10000,
  });
}
