import '../../model/webservice/songs_response.dart';

// ignore: one_member_abstracts
abstract class SongService {
  Future<SongsResponse?> getSongsResponse(String where);
}
