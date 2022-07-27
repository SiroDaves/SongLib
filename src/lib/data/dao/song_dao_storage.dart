import 'package:drift/drift.dart';

import '../../exports.dart';

part 'song_dao_storage.g.dart';

abstract class SongDaoStorage {
  factory SongDaoStorage(MyDatabase db) = _SongDaoStorage;

  Stream<List<DbSong>> getAllSongsStream();

  Future<List<Song>> getLikedSongs();

  Future<List<Song>> getAllSongs();

  Future<void> createSong(Song song);

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
  Future<List<Song>> getLikedSongs() async {
    List<DbSong> dbsongs = await select(db.dbSongTable).get();
    List<Song> songs = [];

    for (int i = 0; i < dbsongs.length; i++) {
      if (dbsongs[i].liked) {
        songs.add(
          Song(
            id: dbsongs[i].id,
            objectId: dbsongs[i].objectId,
            book: dbsongs[i].book,
            songno: dbsongs[i].songno,
            title: dbsongs[i].title,
            alias: dbsongs[i].alias,
            content: dbsongs[i].content,
            author: dbsongs[i].author,
            key: dbsongs[i].key,
            views: dbsongs[i].views,
            createdAt: dbsongs[i].createdAt,
            updatedAt: dbsongs[i].updatedAt,
            liked: dbsongs[i].liked,
          ),
        );
      }
    }
    return songs;
  }

  @override
  Future<List<Song>> getAllSongs() async {
    List<DbSong> dbsongs = await select(db.dbSongTable).get();
    List<Song> songs = [];

    for (int i = 0; i < dbsongs.length; i++) {
      songs.add(
        Song(
          id: dbsongs[i].id,
          objectId: dbsongs[i].objectId,
          book: dbsongs[i].book,
          songno: dbsongs[i].songno,
          title: dbsongs[i].title,
          alias: dbsongs[i].alias,
          content: dbsongs[i].content,
          author: dbsongs[i].author,
          key: dbsongs[i].key,
          views: dbsongs[i].views,
          createdAt: dbsongs[i].createdAt,
          updatedAt: dbsongs[i].updatedAt,
          liked: dbsongs[i].liked,
        ),
      );
    }
    return songs;
  }

  @override
  Stream<List<DbSong>> getAllSongsStream() => select(db.dbSongTable).watch();

  @override
  Future<void> createSong(Song song) => into(db.dbSongTable).insert(
        DbSongTableCompanion.insert(
          objectId: song.objectId!,
          book: Value(song.book!),
          songno: Value(song.songno!),
          title: song.title!,
          alias: song.alias!,
          content: song.content!,
          key: song.key!,
          author: song.author!,
          views: Value(song.views!),
          createdAt: Value(song.createdAt!),
          updatedAt: Value(song.updatedAt!),
        ),
      );

  @override
  Future<void> updateSong(Song song) =>
      (update(db.dbSongTable)..where((row) => row.id.equals(song.id))).write(
        DbSongTableCompanion(
          book: Value(song.book!),
          songno: Value(song.songno!),
          title: Value(song.title!),
          alias: Value(song.alias!),
          content: Value(song.content!),
          key: Value(song.key!),
          author: Value(song.author!),
          views: Value(song.views!),
          updatedAt: Value(song.updatedAt!),
          liked: Value(song.liked!),
        ),
      );
}
