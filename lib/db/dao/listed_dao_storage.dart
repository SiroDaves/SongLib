import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../models/base/listed.dart';
import '../../models/exts/listedext.dart';
import '../../models/exts/songext.dart';
import '../../models/tables/listeds_table.dart';
import '../../utils/constants/utilities.dart';
import '../songlib_db.dart';

part 'listed_dao_storage.g.dart';

@lazySingleton
abstract class ListedDaoStorage {
  @factoryMethod
  factory ListedDaoStorage(SongLibDb db) = _ListedDaoStorage;

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
class _ListedDaoStorage extends DatabaseAccessor<SongLibDb>
    with _$_ListedDaoStorageMixin
    implements ListedDaoStorage {
  _ListedDaoStorage(SongLibDb db) : super(db);

  @override
  Future<List<Listed>> getAllListeds() async {    
    final Stream<List<Listed>> streams = customSelect(
      'SELECT *, '
      ' (SELECT COUNT(*) FROM ${db.listedsTable.actualTableName} tbl2 '
      ' WHERE tbl1.${db.listedsTable.id.name} = tbl2.${db.listedsTable.parentid.name}) as songCount '
      'FROM ${db.listedsTable.actualTableName} tbl1 '
      'WHERE tbl1.${db.listedsTable.parentid.name}=0 '
      'ORDER BY tbl1.${db.listedsTable.id.name} DESC;',
      readsFrom: {db.listedsTable},
    ).watch().map(
      (rows) {
        final List<Listed> listeds = [];
        for (final row in rows) {
          listeds.add(
            Listed(
              id: const IntType().mapFromDatabaseResponse(row.data['id'])!,
              objectId: const StringType()
                  .mapFromDatabaseResponse(row.data['object_id'])!,
              parentid: const IntType()
                  .mapFromDatabaseResponse(row.data['parentid'])!,
              song: const IntType().mapFromDatabaseResponse(row.data['songCount'])!,
              title: const StringType()
                  .mapFromDatabaseResponse(row.data['title'])!,
              description: const StringType()
                  .mapFromDatabaseResponse(row.data['description'])!,
              position: const IntType()
                  .mapFromDatabaseResponse(row.data['position'])!,
              createdAt: const StringType()
                  .mapFromDatabaseResponse(row.data['created_at'])!,
              updatedAt: const StringType()
                  .mapFromDatabaseResponse(row.data['updated_at'])!,
            ),
          );
        }
        return listeds;
      },
    );

    return await streams.first;
  }

  @override
  Future<List<ListedExt>> getListedSongs(int? parentid) async {
    final Stream<List<ListedExt>> streams = customSelect(
      'SELECT ${db.listedsTable.actualTableName}.${db.listedsTable.parentid.name}, ${db.listedsTable.actualTableName}.${db.listedsTable.id.name}, '
      '${db.listedsTable.actualTableName}.${db.listedsTable.position.name}, ${db.listedsTable.actualTableName}.${db.listedsTable.id.name}, '
      '${db.listedsTable.actualTableName}.${db.listedsTable.createdAt.name}, ${db.listedsTable.actualTableName}.${db.listedsTable.updatedAt.name}, '
      '${db.listedsTable.actualTableName}.${db.listedsTable.song.name}, ${db.songsTable.actualTableName}.${db.songsTable.book.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.songNo.name}, ${db.songsTable.actualTableName}.${db.songsTable.title.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.alias.name}, ${db.songsTable.actualTableName}.${db.songsTable.content.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.key.name}, ${db.songsTable.actualTableName}.${db.songsTable.author.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.views.name}, ${db.songsTable.actualTableName}.${db.songsTable.likes.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.liked.name}, ${db.songsTable.actualTableName}.${db.songsTable.id.name} AS songId, '
      '${db.booksTable.actualTableName}.${db.booksTable.title.name} AS songbook '
      'FROM ${db.listedsTable.actualTableName} AS listeds '
      'LEFT JOIN ${db.songsTable.actualTableName} AS songs '
      'ON ${db.listedsTable.actualTableName}.${db.listedsTable.song.name}=${db.songsTable.actualTableName}.${db.songsTable.id.name} '
      'LEFT JOIN ${db.booksTable.actualTableName} AS books '
      'ON ${db.songsTable.actualTableName}.${db.songsTable.book.name}=${db.booksTable.actualTableName}.${db.booksTable.bookNo.name} '
      'WHERE ${db.listedsTable.actualTableName}.${db.listedsTable.parentid.name}=$parentid '
      'ORDER BY ${db.listedsTable.actualTableName}.${db.listedsTable.updatedAt.name} DESC;',
      readsFrom: {db.listedsTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => ListedExt.fromData(row.data)).toList();
      },
    );
    return await streams.first;
  }

  @override
  Future<List<Listed>> getAllListedSongs() async {
    final List<Listeds> results = await select(db.listedsTable).get();
    final List<Listed> listeds = [];
    for (final result in results) {
      listeds.add(
        Listed(
          id: const IntType().mapFromDatabaseResponse(result.id)!,
          objectId:
              const StringType().mapFromDatabaseResponse(result.objectId)!,
          song: const IntType().mapFromDatabaseResponse(result.song)!,
          parentid: const IntType().mapFromDatabaseResponse(result.parentid)!,
          title: const StringType().mapFromDatabaseResponse(result.title)!,
          description:
              const StringType().mapFromDatabaseResponse(result.description)!,
          position: const IntType().mapFromDatabaseResponse(result.position)!,
          createdAt:
              const StringType().mapFromDatabaseResponse(result.createdAt)!,
          updatedAt:
              const StringType().mapFromDatabaseResponse(result.updatedAt)!,
        ),
      );
    }
    return listeds;
  }

  @override
  Future<int> createListed(Listed listed) async {
    return await into(db.listedsTable).insert(
      ListedsTableCompanion.insert(
        objectId: Value(listed.objectId!),
        title: Value(listed.title!),
        description: Value(listed.description!),
        createdAt: Value(dateNow()),
        updatedAt: Value(dateNow()),
      ),
    );
  }

  @override
  Future<void> createListedSong(Listed listed, SongExt song) async =>
      into(db.listedsTable).insert(
        ListedsTableCompanion.insert(
          objectId: const Value.absent(),
          parentid: Value(listed.id!),
          song: Value(song.id!),
          title: Value(songItemTitle(song.songNo!, song.title!)),
          description: Value(truncateString(30, song.content!)),
          createdAt: Value(dateNow()),
          updatedAt: Value(dateNow()),
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
          updatedAt: Value(dateNow()),
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
