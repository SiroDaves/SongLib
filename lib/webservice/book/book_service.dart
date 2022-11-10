import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

abstract class BookService {
  Future<List<ParseObject>> queryBooks();
}
