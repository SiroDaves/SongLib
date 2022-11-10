import 'package:injectable/injectable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../model/base/edit.dart';
import '../../util/constants/api_constants.dart';
import '../../util/constants/utilities.dart';
import 'edit_service.dart';

@injectable
@LazySingleton(as: EditService)
class EditWebService implements EditService {
  @override
  Future<List<ParseObject>> queryEdits(List<int> books) async {
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(ApiConstants.song));
    parseQuery
      ..whereContainedIn('book', books)
      ..orderByAscending('songNo')
      ..setLimit(10000);
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<List<Edit>> fetchEdits(List<int> books) async {
    final List<Edit> songs = [];
    final List<ParseObject> objects = await queryEdits(books);
    if (objects.isNotEmpty) {
      for (final object in objects) {
        final Edit song = Edit(
          objectId: object.get<String>('objectId'),
          id: object.get<int>('id'),
          book: object.get<int>('book'),
          songNo: object.get<int>('songNo'),
          title: object.get<String>('title'),
          alias: object.get<String>('alias'),
          content: object.get<String>('content'),
          author: object.get<String>('author'),
          key: object.get<String>('key'),
          views: object.get<int>('views'),
          likes: object.get<int>('likes'),
          liked: object.get<bool>('liked'),
          createdAt: dateToString(object.get<DateTime>('createdAt')!),
          updatedAt: dateToString(object.get<DateTime>('updatedAt')!),
        );
        songs.add(song);
      }
    }
    return songs;
  }
}
