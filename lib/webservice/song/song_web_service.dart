import 'package:injectable/injectable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../model/base/song.dart';
import '../../util/constants/api_constants.dart';
import '../../util/constants/utilities.dart';
import 'song_service.dart';

@injectable
@LazySingleton(as: SongService)
class SongWebService implements SongService {
 
  @override
  Future<List<ParseObject>> querySongs(String where) async {
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(ApiConstants.song));
    parseQuery.whereEqualTo('enabled', where);
    parseQuery.orderByAscending('songNo');
    parseQuery.setLimit(10000);
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
  
  Future<List<Song>> fetchSongs(String selectedBooks) async {
    final List<Song> songs = [];
    final List<ParseObject> objects = await querySongs('{"book":{"\$in":[$selectedBooks]}}');
    if (objects.isNotEmpty) {
      for (final object in objects) {
        final Song song = Song(
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
