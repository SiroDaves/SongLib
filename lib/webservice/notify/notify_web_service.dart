import 'package:injectable/injectable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../model/general/notify.dart';
import '../../util/constants/api_constants.dart';
import '../../util/constants/utilities.dart';
import 'notify_service.dart';

@injectable
@LazySingleton(as: NotifyService)
class NotifyWebService implements NotifyService {
  @override
  Future<List<ParseObject>> queryNotifys() async {
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(ApiConstants.notify));
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<List<Notify>> fetchNotifys() async {
    final List<Notify> notifys = [];
    final List<ParseObject> objects = await queryNotifys();
    if (objects.isNotEmpty) {
      for (final object in objects) {
        final Notify notify = Notify(
          objectId: object.get<String>('objectId'),
          title: object.get<String>('title'),
          message: object.get<String>('message'),
          image: object.get<String>('image'),
          views: object.get<int>('views'),
          createdAt: dateToString(object.get<DateTime>('createdAt')!),
          updatedAt: dateToString(object.get<DateTime>('updatedAt')!),
        );
        notifys.add(notify);
      }
    }
    return notifys;
  }
}
