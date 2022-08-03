import '../../model/base/song.dart';

// ignore: one_member_abstracts
abstract class SongService {
  Future<List<Song>> getSongs();
}
