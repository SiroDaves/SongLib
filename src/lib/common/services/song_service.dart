import '../../exports.dart';

abstract class SongService {
  Future<List<Song>> getSongs();
}
