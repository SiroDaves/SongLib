import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/listed.dart';
import '../../model/base/listedext.dart';
import '../../model/base/songext.dart';
import '../../model/tables/listeds_table.dart';
import '../../utils/utilities.dart';
import '../app_database.dart';

part 'listed_dao.g.dart';

@lazySingleton
abstract class ListedDao {
  @factoryMethod
  factory ListedDao(AppDatabase db) = _ListedDao;

  Future<List<Listed>> getAllListeds();
  Future<List<Listed>> getAllListedSongs();
  Future<List<ListedExt>> getListedSongs(int parentid);
  Future<int> createListed(Listed listed);
  Future<void> createListedSong(Listed listed, SongExt song);
  Future<void> updateListed(Listed listed);
  Future<void> deleteListed(Listed listed);
  Future<void> deleteListedSongs(Listed listed);
}

@DriftAccessor(tables: [
  ListedsTable,
])
class _ListedDao extends DatabaseAccessor<AppDatabase>
    with _$_ListedDaoMixin
    implements ListedDao {
  _ListedDao(AppDatabase db) : super(db);

  @override
  Future<List<Listed>> getAllListeds() async {
    return await customSelect(
      'SELECT *, '
      ' (SELECT COUNT(*) FROM ${db.listedsTable.actualTableName} tbl2 '
      ' WHERE tbl1.${db.listedsTable.id.name} = tbl2.${db.listedsTable.parentid.name}) as songCount '
      'FROM ${db.listedsTable.actualTableName} tbl1 '
      'WHERE tbl1.${db.listedsTable.parentid.name}=0 '
      'ORDER BY tbl1.${db.listedsTable.id.name} DESC;',
      readsFrom: {db.listedsTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => Listed.fromData(row.data)).toList();
      },
    ).first;
  }

  @override
  Future<List<ListedExt>> getListedSongs(int? parentid) async {
    return await customSelect(
      'SELECT lists.${db.listedsTable.parentid.name}, lists.${db.listedsTable.id.name}, lists.${db.listedsTable.position.name}, '
      'lists.${db.listedsTable.id.name}, lists.${db.listedsTable.created.name}, lists.${db.listedsTable.updated.name}, '
      'lists.${db.listedsTable.song.name}, songs.${db.songsTable.book.name}, songs.${db.songsTable.songNo.name}, '
      'songs.${db.songsTable.title.name}, songs.${db.songsTable.alias.name}, songs.${db.songsTable.content.name}, '
      'songs.${db.songsTable.key.name}, songs.${db.songsTable.author.name}, songs.${db.songsTable.views.name}, '
      'songs.${db.songsTable.likes.name}, songs.${db.songsTable.liked.name}, songs.${db.songsTable.id.name} AS songId, '
      'books.${db.booksTable.title.name} AS songbook '
      'FROM ${db.listedsTable.actualTableName} AS lists '
      'LEFT JOIN ${db.songsTable.actualTableName} AS songs '
      'ON lists.${db.listedsTable.song.name}=songs.${db.songsTable.id.name} '
      'LEFT JOIN ${db.booksTable.actualTableName} AS books '
      'ON songs.${db.songsTable.book.name}=books.${db.booksTable.bookNo.name} '
      'WHERE lists.${db.listedsTable.parentid.name}=$parentid '
      'ORDER BY lists.${db.listedsTable.updated.name} DESC;',
      readsFrom: {db.listedsTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => ListedExt.fromData(row.data)).toList();
      },
    ).first;
  }

  @override
  Future<List<Listed>> getAllListedSongs() async {
    final List<Listeds> results = await select(db.listedsTable).get();
    return results
        .map(
          (result) => Listed(
            id: const IntType().mapFromDatabaseResponse(result.id)!,
            listedId:
                const IntType().mapFromDatabaseResponse(result.listedId)!,
            song: const IntType().mapFromDatabaseResponse(result.song)!,
            parentid: const IntType().mapFromDatabaseResponse(result.parentid)!,
            title: const StringType().mapFromDatabaseResponse(result.title)!,
            description:
                const StringType().mapFromDatabaseResponse(result.description)!,
            position: const IntType().mapFromDatabaseResponse(result.position)!,
            created:
                const StringType().mapFromDatabaseResponse(result.created)!,
            updated:
                const StringType().mapFromDatabaseResponse(result.updated)!,
          ),
        )
        .toList();
  }

  @override
  Future<int> createListed(Listed listed) async {
    return await into(db.listedsTable).insert(
      ListedsTableCompanion.insert(
        listedId: Value(listed.listedId!),
        title: Value(listed.title!),
        description: Value(listed.description!),
        created: Value(dateNow()),
        updated: Value(dateNow()),
      ),
    );
  }

  @override
  Future<void> createListedSong(Listed listed, SongExt song) async =>
      into(db.listedsTable).insert(
        ListedsTableCompanion.insert(
          listedId: const Value.absent(),
          parentid: Value(listed.id!),
          song: Value(song.id!),
          title: Value(songItemTitle(song.songNo!, song.title!)),
          description: Value(truncateString(30, song.content!)),
          created: Value(dateNow()),
          updated: Value(dateNow()),
        ),
      );

  @override
  Future<void> updateListed(Listed listed) =>
      (update(db.listedsTable)..where((row) => row.id.equals(listed.id)))
          .write(
        ListedsTableCompanion(
          parentid: Value(listed.parentid!),
          title: Value(listed.title!),
          description: Value(listed.description!),
          position: Value(listed.position!),
          updated: Value(dateNow()),
        ),
      );

  @override
  Future<void> deleteListed(Listed listed) =>
      (delete(db.listedsTable)..where((row) => row.id.equals(listed.id))).go();

  @override
  Future<void> deleteListedSongs(Listed listed) =>
      (delete(db.listedsTable)..where((row) => row.parentid.equals(listed.id)))
          .go();
}
