import 'dart:developer' as logger show log;
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/song.dart';
import '../../model/tables/songs_table.dart';
import '../../utils/utilities.dart';
import '../app_database.dart';

part 'song_dao.g.dart';

@lazySingleton
abstract class SongDao {
  @factoryMethod
  factory SongDao(AppDatabase db) = _SongDao;

  Future<void> checkSongs();
  Future<List<Song>> getAllSongs();
  Future<int> createSong(Song song);
  Future<void> updateSong(Song song);
  Future<void> deleteSong(Song song);
  Future<void> deleteSongs();
  Future<void> dropSongsTable();
}

@DriftAccessor(tables: [
  SongsTable,
])
class _SongDao extends DatabaseAccessor<AppDatabase>
    with _$_SongDaoMixin
    implements SongDao {
  _SongDao(AppDatabase db) : super(db);

  @override
  Future<void> checkSongs() async {
    logger.log('Checking for if song tables exists as expected');
    try {
      String sqlQry =
          'SELECT * FROM ${db.songsTable.actualTableName} ORDER BY ${db.songsTable.id.name} ASC;';
      logger.log('Select Query: $sqlQry');
      await customSelect(sqlQry).watch().first;
      logger.log('${db.songsTable.actualTableName} table exists as expected');
    } catch (e) {
      logger.log('Query Error: $e');
      try {
        String sqlQry =
            'ALTER TABLE db_song_table RENAME TO ${db.songsTable.actualTableName};';
        logger.log('Alter Query: $sqlQry');
        await customStatement(sqlQry);
        logger.log(
            'db_song_table renamed to ${db.songsTable.actualTableName} successfully');
      } catch (e) {
        logger.log('Query Error: $e');
      }
    }
  }

  @override
  Future<List<Song>> getAllSongs() async {
    List<Song> items = [];
    String sqlQry =
        'SELECT * FROM ${db.songsTable.actualTableName} ORDER BY ${db.songsTable.id.name} ASC;';
    logger.log('Select Query: $sqlQry');

    try {
      final List<Songs> results = await select(db.songsTable).get();
      items = results
          .map(
            (result) => Song(
              id: const IntType().mapFromDatabaseResponse(result.id)!,
              songId: const IntType().mapFromDatabaseResponse(result.songId)!,
              book: const IntType().mapFromDatabaseResponse(result.book)!,
              songNo: const IntType().mapFromDatabaseResponse(result.songNo)!,
              title: const StringType().mapFromDatabaseResponse(result.title)!,
              content:
                  const StringType().mapFromDatabaseResponse(result.content)!,
              alias: const StringType().mapFromDatabaseResponse(result.alias)!,
              key: const StringType().mapFromDatabaseResponse(result.key)!,
              created:
                  const StringType().mapFromDatabaseResponse(result.created)!,
            ),
          )
          .toList();
    } catch (e) {
      logger.log('Query Error: $e');
    }
    return items;
  }

  @override
  Future<int> createSong(Song song) async {
    int result = 0;
    String sqlQry = "INSERT INTO ${db.songsTable.actualTableName} "
        "(${db.songsTable.songId.name}, ${db.songsTable.book.name}, ${db.songsTable.songNo.name}, ${db.songsTable.title.name}, ${db.songsTable.alias.name}, "
        "${db.songsTable.content.name}, ${db.songsTable.key.name},  ${db.songsTable.author.name}, ${db.songsTable.views.name}, ${db.songsTable.created.name}}) "
        "VALUES (${song.songId}, ${song.book}, ${song.songNo}, ${song.title}, ${song.alias}, ${song.content}, ${song.key}, ${song.author}, ${song.views}, ${song.created});";
    logger.log('Insert Query: $sqlQry');
    try {
      final sqlStatement = SongsTableCompanion.insert(
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
      );
      result = await into(db.songsTable).insert(sqlStatement);
    } catch (e) {
      logger.log('Query Error: $e');
    }
    return result;
  }

  @override
  Future<int> updateSong(Song song) async {
    int result = 0;
    String sqlQry = "UPDATE ${db.songsTable.actualTableName} "
        "SET (${db.songsTable.songId.name} = ${song.songId}, ${db.songsTable.book.name} = ${song.book}, ${db.songsTable.songNo.name} = ${song.songNo}, "
        "${db.songsTable.title.name} = ${song.title}, ${db.songsTable.alias.name} = ${song.alias}, ${db.songsTable.content.name} = ${song.content}, "
        "${db.songsTable.key.name} = ${song.key}, ${db.songsTable.key.name} = ${song.key}, ${db.songsTable.author.name} = ${song.author}, "
        "${db.songsTable.views.name} = ${song.views}, ${db.songsTable.liked.name} = ${song.liked}, ${db.songsTable.updated.name} = ${song.updated}) "
        "WHERE ${db.songsTable.id.name} = ${song.id};";
    logger.log('Update Query: $sqlQry');
    try {
      final sqlStatement = SongsTableCompanion(
        songId: Value(song.songId!),
        book: Value(song.book!),
        songNo: Value(song.songNo!),
        title: Value(song.title!),
        alias: Value(song.alias!),
        content: Value(song.content!),
        key: Value(song.key!),
        author: Value(song.author!),
        views: Value(song.views!),
        liked: Value(song.liked!),
        updated: Value(dateNow()),
      );
      await (update(db.songsTable)..where((row) => row.id.equals(song.id)))
          .write(sqlStatement);
    } catch (e) {
      logger.log('Query Error: $e');
    }

    return result;
  }

  @override
  Future<void> deleteSong(Song song) async {
    try {
      String sqlQry =
          'DELETE FROM ${db.songsTable.actualTableName} WHERE ${db.songsTable.id.name} = ${song.id};';
      logger.log('Delete Query: $sqlQry');
      await (delete(db.songsTable)..where((row) => row.id.equals(song.id)))
          .go();
    } catch (e) {
      logger.log('Query Error: $e');
    }
  }

  @override
  Future<void> deleteSongs() async {
    try {
      String sqlQry = 'DELETE FROM ${db.songsTable.actualTableName};';
      logger.log('Delete Query: $sqlQry');
      await (delete(db.songsTable)).go();
    } catch (e) {
      logger.log('Query Error: $e');
    }
  }

  @override
  Future<void> dropSongsTable() async {
    try {
      String sqlQry = 'DROP TABLE ${db.songsTable.actualTableName};';
      logger.log('Delete Query: $sqlQry');
      await (delete(db.songsTable)).go();
    } catch (e) {
      logger.log('Query Error: $e');
    }
  }
}
