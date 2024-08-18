import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';
import '../../models/song.dart';
import '../../models/songext.dart';

@dao
abstract class SongsDao {
  @Query('SELECT * FROM ${AppConstants.songsTable} WHERE rid = :rid')
  Future<Song?> findSongById(int rid);

  @Query('SELECT * FROM ${AppConstants.songsTable}')
  Future<List<Song>> fetchSongs();

  @Query('SELECT * FROM ${AppConstants.songsTableViews}')
  Stream<List<SongExt>> fetchSongExts();

  @Query('SELECT * FROM ${AppConstants.songsTableViews} WHERE liked=1')
  Stream<List<SongExt>> fetchLikedSongs();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertSong(Song song);

  @update
  Future<void> updateSong(Song song);

  @delete
  Future<void> deleteSong(Song song);

  @Query("DELETE FROM ${AppConstants.songsTable}")
  Future<void> deleteAllSongs();
}
