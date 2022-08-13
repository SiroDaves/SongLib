import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/webservice/books_response.dart';
import '../../util/constants/api_constants.dart';
import 'book_service.dart';

part 'book_webservice.g.dart';

@dev
@prod
@Singleton(as: BookService)
@RestApi()
abstract class BookWebService extends BookService {
  @factoryMethod
  factory BookWebService(Dio dio) = _BookWebService;

  @override
  @GET(ApiConstants.book)
  Future<BooksResponse> getBooksResponse({
    @Query('where') String where = '{"enabled":true}',
    @Query('order') String order = 'position',
  });
}
