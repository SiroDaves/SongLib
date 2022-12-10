import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../models/base/song.dart';
import '../../models/exts/songext.dart';
import '../../models/tables/songs_table.dart';
import '../songlib_db.dart';

part 'song_dao_storage.g.dart';

@lazySingleton
abstract class SongDaoStorage {
  @factoryMethod
  factory SongDaoStorage(SongLibDb db) = _SongDaoStorage;

  Future<List<SongExt>> getLikedSongs();
  Future<List<SongExt>> getAllSongs();
  Future<void> createSong(Song song);
  Future<void> updateSong(SongExt song);
  Future<void> deleteSong(SongExt song);
}

@DriftAccessor(tables: [
  SongsTable,
])
class _SongDaoStorage extends DatabaseAccessor<SongLibDb>
    with _$_SongDaoStorageMixin
    implements SongDaoStorage {
  _SongDaoStorage(SongLibDb db) : super(db);

  @override
  Future<List<SongExt>> getLikedSongs() async {
    final Stream<List<SongExt>> streams = customSelect(
      'SELECT ${db.songsTable.actualTableName}.${db.songsTable.book.name}, ${db.songsTable.actualTableName}.${db.songsTable.songNo.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.title.name}, ${db.songsTable.actualTableName}.${db.songsTable.alias.name}, ${db.songsTable.actualTableName}.${db.songsTable.content.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.key.name}, ${db.songsTable.actualTableName}.${db.songsTable.author.name}, ${db.songsTable.actualTableName}.${db.songsTable.views.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.likes.name}, ${db.songsTable.actualTableName}.${db.songsTable.createdAt.name}, ${db.songsTable.actualTableName}.${db.songsTable.updatedAt.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.liked.name}, ${db.songsTable.actualTableName}.${db.songsTable.id.name}, '
      '${db.booksTable.actualTableName}.${db.booksTable.title.name} AS songbook '
      'FROM ${db.songsTable.actualTableName} AS songs '
      'LEFT JOIN ${db.booksTable.actualTableName} AS books '
      'ON ${db.songsTable.actualTableName}.${db.songsTable.book.name}=${db.booksTable.actualTableName}.${db.booksTable.bookNo.name} '
      'WHERE ${db.songsTable.actualTableName}.${db.songsTable.liked.name}=true '
      'ORDER BY ${db.songsTable.actualTableName}.${db.songsTable.updatedAt.name} DESC;',
      readsFrom: {db.songsTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => SongExt.fromData(row.data)).toList();
      },
    );
    return await streams.first;
  }

  @override
  Future<List<SongExt>> getAllSongs() async {
    final Stream<List<SongExt>> streams = customSelect(
      'SELECT ${db.songsTable.actualTableName}.${db.songsTable.book.name}, ${db.songsTable.actualTableName}.${db.songsTable.songNo.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.title.name}, ${db.songsTable.actualTableName}.${db.songsTable.alias.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.content.name}, ${db.songsTable.actualTableName}.${db.songsTable.key.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.author.name}, ${db.songsTable.actualTableName}.${db.songsTable.views.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.likes.name}, ${db.songsTable.actualTableName}.${db.songsTable.createdAt.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.updatedAt.name}, ${db.songsTable.actualTableName}.${db.songsTable.liked.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.id.name}, ${db.booksTable.actualTableName}.${db.booksTable.title.name} AS songbook '
      'FROM ${db.songsTable.actualTableName} AS songs '
      'LEFT JOIN ${db.booksTable.actualTableName} AS books '
      'ON ${db.songsTable.actualTableName}.${db.songsTable.book.name}=${db.booksTable.actualTableName}.${db.booksTable.bookNo.name} '
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
          objectId: song.objectId!,
          book: Value(song.book!),
          songNo: Value(song.songNo!),
          title: Value(song.title!),
          alias: Value(song.alias!),
          content: Value(song.content!),
          key: Value(song.key!),
          author: Value(song.author!),
          views: Value(song.views!),
          createdAt: Value(song.createdAt!),
          updatedAt: Value(song.updatedAt!),
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
          updatedAt: Value(song.updatedAt!),
          liked: Value(song.liked!),
        ),
      );

  @override
  Future<void> deleteSong(SongExt song) =>
      (delete(db.songsTable)..where((row) => row.id.equals(song.id))).go();
}
