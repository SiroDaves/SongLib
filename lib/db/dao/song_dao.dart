import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/song.dart';
import '../../model/base/songext.dart';
import '../../model/tables/songs_table.dart';
import '../app_database.dart';

part 'song_dao.g.dart';

@lazySingleton
abstract class SongDao {
  @factoryMethod
  factory SongDao(AppDatabase db) = _SongDao;

  Future<List<SongExt>> getLikedSongs();
  Future<List<SongExt>> getAllSongs();
  Future<void> createSong(Song song);
  Future<void> updateSong(SongExt song);
  Future<void> deleteSong(SongExt song);
}

@DriftAccessor(tables: [
  SongsTable,
])
class _SongDao extends DatabaseAccessor<AppDatabase>
    with _$_SongDaoMixin
    implements SongDao {
  _SongDao(AppDatabase db) : super(db);
  

  @override
  Future<List<SongExt>> getLikedSongs() async {
    return await customSelect(
      'SELECT '
      'songs.${db.songsTable.id.name}, '
      'songs.${db.songsTable.book.name}, '
      'songs.${db.songsTable.songNo.name}, '
      'songs.${db.songsTable.title.name}, '
      'songs.${db.songsTable.alias.name}, '
      'songs.${db.songsTable.content.name}, '
      'songs.${db.songsTable.key.name}, '
      'songs.${db.songsTable.author.name}, '
      'songs.${db.songsTable.views.name}, '
      'songs.${db.songsTable.likes.name}, '
      'songs.${db.songsTable.created.name}, '
      'songs.${db.songsTable.updated.name}, '
      'songs.${db.songsTable.liked.name}, '
      'songs.${db.songsTable.songId.name} AS songid, '
      'books.${db.booksTable.title.name} AS songbook '
      'FROM ${db.songsTable.actualTableName} AS songs '
      'LEFT JOIN ${db.booksTable.actualTableName} AS books '
      'ON songs.${db.songsTable.book.name}=books.${db.booksTable.bookNo.name} '
      'WHERE songs.${db.songsTable.liked.name}=true '
      'ORDER BY songs.${db.songsTable.updated.name} DESC;',
      readsFrom: {db.songsTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => SongExt.fromData(row.data)).toList();
      },
    ).first;
  }

  @override
  Future<List<SongExt>> getAllSongs() async {
    final Stream<List<SongExt>> streams = customSelect(
      'SELECT '
      'songs.${db.songsTable.id.name}, '
      'songs.${db.songsTable.book.name}, '
      'songs.${db.songsTable.songNo.name}, '
      'songs.${db.songsTable.title.name}, '
      'songs.${db.songsTable.alias.name}, '
      'songs.${db.songsTable.content.name}, '
      'songs.${db.songsTable.key.name}, '
      'songs.${db.songsTable.author.name}, '
      'songs.${db.songsTable.views.name}, '
      'songs.${db.songsTable.likes.name}, '
      'songs.${db.songsTable.created.name}, '
      'songs.${db.songsTable.updated.name}, '
      'songs.${db.songsTable.liked.name}, '
      'songs.${db.songsTable.songId.name} AS songid, '
      'books.${db.booksTable.title.name} AS songbook '
      'FROM ${db.songsTable.actualTableName} AS songs '
      'LEFT JOIN ${db.booksTable.actualTableName} AS books '
      'ON songs.${db.songsTable.book.name}=books.${db.booksTable.bookNo.name} '
      'ORDER BY ${db.songsTable.songNo.name} ASC;',
      readsFrom: {db.songsTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => SongExt.fromData(row.data)).toList();
      },
    );
    return await streams.first;
  }

  @override
  Future<void> createSong(Song song) => into(db.songsTable).insert(
        SongsTableCompanion.insert(
          songId: Value(song.songId!),
          book: Value(song.book!),
          songNo: Value(song.songNo!),
          title: Value(song.title!),
          alias: Value(song.alias!),
          content: Value(song.content!),
          key: Value(song.key!),
          author: Value(song.author!),
          views: Value(song.views!),
          created: Value(song.created!),
          updated: Value(song.updated!),
        ),
      );

  @override
  Future<void> updateSong(SongExt song) =>
      (update(db.songsTable)..where((row) => row.id.equals(song.id))).write(
        SongsTableCompanion(
          book: Value(song.book!),
          songNo: Value(song.songNo!),
          title: Value(song.title!),
          alias: Value(song.alias!),
          content: Value(song.content!),
          key: Value(song.key!),
          author: Value(song.author!),
          views: Value(song.views!),
          updated: Value(song.updated!),
          liked: Value(song.liked!),
        ),
      );

  @override
  Future<void> deleteSong(SongExt song) =>
      (delete(db.songsTable)..where((row) => row.id.equals(song.id))).go();
}
