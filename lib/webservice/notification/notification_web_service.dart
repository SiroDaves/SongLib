import 'package:injectable/injectable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../model/general/notification.dart';
import '../../util/constants/api_constants.dart';
import '../../util/constants/utilities.dart';
import 'notification_service.dart';

@injectable
@LazySingleton(as: NotificationService)
class NotificationWebService implements NotificationService {
  @override
  Future<List<ParseObject>> queryNotifications(List<int> books) async {
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(ApiConstants.notification));
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<List<Notification>> fetchNotifications(List<int> books) async {
    final List<Notification> notifications = [];
    final List<ParseObject> objects = await queryNotifications(books);
    if (objects.isNotEmpty) {
      for (final object in objects) {
        final Notification notification = Notification(
          objectId: object.get<String>('objectId'),
          title: object.get<String>('title'),
          content: object.get<String>('content'),
          image: object.get<String>('image'),
          views: object.get<int>('views'),
          createdAt: dateToString(object.get<DateTime>('createdAt')!),
          updatedAt: dateToString(object.get<DateTime>('updatedAt')!),
        );
        notifications.add(notification);
      }
    }
    return notifications;
  }
}
