import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

abstract class NotifyService {
  Future<List<ParseObject>> queryNotifys();
}
