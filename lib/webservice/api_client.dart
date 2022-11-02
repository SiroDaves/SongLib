import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../model/webservice/books_response.dart';
import '../model/webservice/edits_response.dart';
import '../model/webservice/notifications_response.dart';
import '../model/webservice/songs_response.dart';
import '../util/constants/api_constants.dart';
import 'web_service.dart';

part 'api_client.g.dart';

@dev
@prod
@Singleton(as: WebService)
@RestApi()
abstract class ApiClient extends WebService {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @override
  @GET(ApiConstants.book)
  Future<BooksResponse> getBooksResponse({
    @Query('where') String where = '{"enabled":true}',
    @Query('order') String order = 'position',
  });

  @override
  @GET(ApiConstants.edit)
  Future<EditsResponse> getEditsResponse();

  @override
  @GET(ApiConstants.notification)
  Future<NotificationsResponse> getNotificationsResponse();

  @override
  @GET(ApiConstants.song)
  Future<SongsResponse> getSongsResponse(
    @Query('where') String where, {
    @Query('order') String order = 'songNo',
    @Query('limit') int limit = 10000,
  });
}
