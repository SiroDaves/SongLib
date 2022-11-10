import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

abstract class NotificationService {
  Future<List<ParseObject>> queryNotifications(List<int> books);
}
