import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

// ignore: one_member_abstracts
abstract class WebService {
  Future<List<ParseObject>> queryBooks();
  Future<List<ParseObject>> queryEdits(List<int> books);
  Future<List<ParseObject>> querySongs(List<int> books);
  Future<List<ParseObject>> queryNotifycations();
}