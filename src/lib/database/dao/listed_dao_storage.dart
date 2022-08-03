import 'package:drift/drift.dart';

import '../../model/base/listed.dart';
import '../../model/database/db_listed_table.dart';
import '../songlib_database.dart';


part 'listed_dao_storage.g.dart';

abstract class ListedDaoStorage {
  factory ListedDaoStorage(SongLibDatabase db) = _ListedDaoStorage;

  Stream<List<DbListed>> getAllListedsStream();

  Future<List<Listed>> getAllListeds({int parentid});

  Future<void> createListed(Listed listed);

  Future<void> createListedChild(Listed listed);

  Future<void> updateListed(Listed listed);
}

@DriftAccessor(tables: [
  DbListedTable,
])
class _ListedDaoStorage extends DatabaseAccessor<SongLibDatabase>
    with _$_ListedDaoStorageMixin
    implements ListedDaoStorage {
  _ListedDaoStorage(SongLibDatabase db) : super(db);

  @override
  Future<List<Listed>> getAllListeds({int? parentid = 0}) async {
    //List<DbListed> dbListeds = await select(db.dbListedTable).get();

    Stream<List<DbListed>> streams = getAllListedsStream();
    List<DbListed> dbListeds = await streams.first;
    List<Listed> listeds = [];

    /*customSelect(
      //'SELECT * FROM DbListed WHERE parentid=0;',
      'SELECT * FROM ${db.dbListedTable};',
      readsFrom: {db.dbListedTable},
    ).watch().map(
      (rows) {
        dbListeds = rows
            .map(
              (row) => DbListed.fromData(row.data),
            )
            .toList();
      },
    );*/

    for (int i = 0; i < dbListeds.length; i++) {
      listeds.add(
        Listed(
          id: dbListeds[i].id,
          objectId: dbListeds[i].objectId,
          parentid: dbListeds[i].parentid,
          title: dbListeds[i].title,
          description: dbListeds[i].description,
          position: dbListeds[i].position,
          createdAt: dbListeds[i].createdAt,
          updatedAt: dbListeds[i].updatedAt,
        ),
      );
    }
    return listeds;
  }

  @override
  Stream<List<DbListed>> getAllListedsStream() {
    /*customSelect(
      //'SELECT * FROM DbListed WHERE parentid=0;',
      'SELECT * FROM ${db.dbListedTable};',
      readsFrom: {db.dbListedTable},
    ).watch().map(
      (rows) {
        dbListeds = rows
            .map(
              (row) => DbListed.fromData(row.data),
            )
            .toList();
      },
    );*/

    return customSelect(
      'SELECT * FROM ${db.dbListedTable.actualTableName} '
      'WHERE ${db.dbListedTable.parentid.name}=0;',
      readsFrom: {db.dbListedTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => DbListed.fromData(row.data)).toList();
      },
    );
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
