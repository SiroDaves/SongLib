import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';
import '../../models/song.dart';
import '../../models/songext.dart';

@dao
abstract class SongsDao {
  @Query('SELECT * FROM ${AppConstants.songsTable} WHERE rid = :rid')
  Future<Song?> findSongById(int rid);

  @Query('SELECT * FROM ${AppConstants.songsTableViews} WHERE book = :bid')
  Stream<List<SongExt>> fetchSongs(int bid);

  @Query('SELECT * FROM ${AppConstants.songsTableViews} WHERE liked = 1')
  Stream<List<SongExt>> fetchLikes();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertSong(Song song);

  @update
  Future<void> updateSong(Song song);

  @delete
  Future<void> deleteSong(Song song);

  @Query("DELETE FROM ${AppConstants.songsTable}")
  Future<void> deleteAllSongs();
}
