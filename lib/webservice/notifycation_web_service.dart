import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../model/general/notifycation.dart';
import '../util/constants/api_constants.dart';
import '../util/constants/utilities.dart';

class NotifycationWebService {
  Future<List<ParseObject>> queryNotifycations() async {
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(ApiConstants.Notifycation));
    parseQuery.whereEqualTo('enabled', true);
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<List<Notifycation>> fetchNotifycations() async {
    final List<Notifycation> notifycations = [];
    final List<ParseObject> objects = await queryNotifycations();
    if (objects.isNotEmpty) {
      for (final object in objects) {
        final Notifycation notifycation = Notifycation(
          objectId: object.get<String>('objectId'),
          title: object.get<String>('title'),
          message: object.get<String>('message'),
          image: object.get<String>('image'),
          views: object.get<int>('views'),
          createdAt: dateToString(object.get<DateTime>('createdAt')!),
          updatedAt: dateToString(object.get<DateTime>('updatedAt')!),
        );
        notifycations.add(notifycation);
      }
    }
    return notifycations;
  }
}
