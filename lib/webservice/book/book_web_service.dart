import 'package:injectable/injectable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../model/base/book.dart';
import '../../util/constants/api_constants.dart';
import '../../util/constants/utilities.dart';
import 'book_service.dart';

@injectable
@LazySingleton(as: BookService)
class BookWebService implements BookService {
  @override
  Future<List<ParseObject>> queryBooks() async {
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(ApiConstants.book));
    parseQuery
      ..whereEqualTo('enabled', true)
      ..orderByAscending('position');
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      // ignore: avoid_print
      print('Error: ${apiResponse.error}');
      return [];
    }
  }

  Future<List<Book>> fetchBooks() async {
    final List<Book> books = [];
    final List<ParseObject> objects = await queryBooks();
    if (objects.isNotEmpty) {
      for (final object in objects) {
        final Book book = Book(
          objectId: object.get<String>('objectId'),
          id: object.get<int>('id'),
          bookNo: object.get<int>('bookNo'),
          title: object.get<String>('title'),
          subTitle: object.get<String>('subTitle'),
          position: object.get<int>('position'),
          songs: object.get<int>('songs'),
          enabled: object.get<bool>('enabled'),
          createdAt: dateToString(object.get<DateTime>('createdAt')!),
          updatedAt: dateToString(object.get<DateTime>('updatedAt')!),
        );
        books.add(book);
      }
    }
    return books;
  }
}
