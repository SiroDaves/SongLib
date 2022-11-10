import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

abstract class SongService {
  Future<List<ParseObject>> querySongs(List<int> books);
}
