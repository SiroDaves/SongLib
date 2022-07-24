import 'package:drift/drift.dart';

import '../../exports.dart';

part 'song_dao_storage.g.dart';

abstract class SongDaoStorage {
  factory SongDaoStorage(MyDatabase db) = _SongDaoStorage;

  Stream<List<DbSong>> getAllSongsStream();

  Future<List<DbSong>> getAllSongs();

  Future<void> createSong(Song song);

  Future<void> createSongWithValue(Song song);

  Future<void> updateSong(Song song);
}

@DriftAccessor(tables: [
  DbSongTable,
])
class _SongDaoStorage extends DatabaseAccessor<MyDatabase>
    with _$_SongDaoStorageMixin
    implements SongDaoStorage {
  _SongDaoStorage(MyDatabase db) : super(db);

  @override
  Future<List<DbSong>> getAllSongs() => select(db.dbSongTable).get();

  @override
  Stream<List<DbSong>> getAllSongsStream() => select(db.dbSongTable).watch();

  @override
  Future<void> createSong(Song song) => into(db.dbSongTable).insert(
        DbSongTableCompanion.insert(
          objectId: song.objectId,
          book: Value(song.book),
          songno: Value(song.songno),
          title: song.title,
          alias: song.alias,
          content: song.content,
          key: song.key,
          author: song.author,
          views: Value(song.views),
          createdAt: song.createdAt,
          updatedAt: song.updatedAt,
        ),
      );

  @override
  Future<void> createSongWithValue(Song song) async =>
      into(db.dbSongTable).insert(
        DbSongTableCompanion.insert(
          objectId: song.objectId,
          book: Value(song.book),
          songno: Value(song.songno),
          title: song.title,
          alias: song.alias,
          content: song.content,
          key: song.key,
          author: song.author,
          views: Value(song.views),
          createdAt: song.createdAt,
          updatedAt: song.updatedAt,
        ),
      );

  @override
  Future<void> updateSong(Song song) =>
      (update(db.dbSongTable)..where((row) => row.id.equals(song.id))).write(
        DbSongTableCompanion(
          book: Value(song.book),
          songno: Value(song.songno),
          title: Value(song.title),
          alias: Value(song.alias),
          content: Value(song.content),
          key: Value(song.key),
          author: Value(song.author),
          views: Value(song.views),
          updatedAt: Value(song.updatedAt),
        ),
      );
}
