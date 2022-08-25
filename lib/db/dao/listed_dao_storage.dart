import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/listed.dart';
import '../../model/base/listedext.dart';
import '../../model/tables/db_listed_table.dart';
import '../songlib_db.dart';

part 'listed_dao_storage.g.dart';

@lazySingleton
abstract class ListedDaoStorage {
  @factoryMethod
  factory ListedDaoStorage(SongLibDb db) = _ListedDaoStorage;

  Future<List<Listed>> getAllListeds();

  Future<List<ListedExt>> getListedSongs(int parentid);

  Future<void> createListed(Listed listed);

  Future<void> createListedChild(Listed listed);

  Future<void> updateListed(Listed listed);
}

@DriftAccessor(tables: [
  DbListedTable,
])
class _ListedDaoStorage extends DatabaseAccessor<SongLibDb>
    with _$_ListedDaoStorageMixin
    implements ListedDaoStorage {
  _ListedDaoStorage(SongLibDb db) : super(db);

  @override
  Future<List<Listed>> getAllListeds() async {
    final Stream<List<Listed>> streams = customSelect(
      'SELECT * FROM ${db.dbListedTable.actualTableName} '
      'WHERE ${db.dbListedTable.parentid.name}=0 '
      'ORDER BY ${db.dbListedTable.id.name} DESC;',
      readsFrom: {db.dbListedTable},
    ).watch().map(
      (rows) {
        final List<Listed> listeds = [];
        for (int i = 0; i < rows.length; i++) {
          listeds.add(
            Listed(
              id: const IntType().mapFromDatabaseResponse(rows[i].data['id'])!,
              objectId: const StringType()
                  .mapFromDatabaseResponse(rows[i].data['object_id'])!,
              parentid: const IntType()
                  .mapFromDatabaseResponse(rows[i].data['parentid'])!,
              song: const IntType()
                  .mapFromDatabaseResponse(rows[i].data['song'])!,
              title: const StringType()
                  .mapFromDatabaseResponse(rows[i].data['title'])!,
              description: const StringType()
                  .mapFromDatabaseResponse(rows[i].data['description'])!,
              position: const IntType()
                  .mapFromDatabaseResponse(rows[i].data['position'])!,
              createdAt: const StringType()
                  .mapFromDatabaseResponse(rows[i].data['created_at'])!,
              updatedAt: const StringType()
                  .mapFromDatabaseResponse(rows[i].data['updated_at'])!,
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
      'SELECT listeds.${db.dbListedTable.parentid.name}, listeds.${db.dbListedTable.position.name}, listeds.${db.dbListedTable.id.name}, '
      'listeds.${db.dbListedTable.createdAt.name}, listeds.${db.dbListedTable.updatedAt.name}, listeds.${db.dbListedTable.song.name}, '
      'songs.${db.dbSongTable.book.name}, songs.${db.dbSongTable.songNo.name}, songs.${db.dbSongTable.title.name}, '
      'songs.${db.dbSongTable.alias.name}, songs.${db.dbSongTable.content.name}, songs.${db.dbSongTable.key.name}, '
      'songs.${db.dbSongTable.author.name}, songs.${db.dbSongTable.views.name}, songs.${db.dbSongTable.likes.name}, '
      'songs.${db.dbSongTable.liked.name}, songs.${db.dbSongTable.id.name} AS songId, '
      'books.${db.dbBookTable.title.name} AS songbook '
      'FROM ${db.dbListedTable.actualTableName} AS listeds '
      'LEFT JOIN ${db.dbSongTable.actualTableName} AS songs '
      'ON listeds.${db.dbListedTable.song.name}=songs.${db.dbSongTable.id.name} '
      'LEFT JOIN ${db.dbBookTable.actualTableName} AS books '
      'ON songs.${db.dbSongTable.book.name}=books.${db.dbBookTable.bookNo.name};'
      'WHERE ${db.dbListedTable.parentid.name}=$parentid '
      'ORDER BY ${db.dbListedTable.id.name} DESC;',
      readsFrom: {db.dbListedTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => ListedExt.fromData(row.data)).toList();
      },
    );
    return await streams.first;
  }

  @override
  Future<void> createListed(Listed listed) => into(db.dbListedTable).insert(
        DbListedTableCompanion.insert(
          objectId: Value(listed.objectId!),
          title: Value(listed.title!),
          description: Value(listed.description!),
        ),
      );

  @override
  Future<void> createListedChild(Listed listed) async =>
      into(db.dbListedTable).insert(
        DbListedTableCompanion.insert(
          objectId: Value(listed.objectId!),
          parentid: Value(listed.parentid!),
          title: Value(listed.title!),
          description: Value(listed.description!),
        ),
      );

  @override
  Future<void> updateListed(Listed listed) =>
      (update(db.dbListedTable)..where((row) => row.id.equals(listed.id)))
          .write(
        DbListedTableCompanion(
          parentid: Value(listed.parentid!),
          title: Value(listed.title!),
          description: Value(listed.description!),
          position: Value(listed.position!),
          updatedAt: Value(listed.updatedAt!),
        ),
      );
}