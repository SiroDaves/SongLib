import 'package:injectable/injectable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

@lazySingleton
abstract class WebService {
  Future<List<ParseObject>> queryBooks();

  Future<List<ParseObject>> querySongs(String where);
}
