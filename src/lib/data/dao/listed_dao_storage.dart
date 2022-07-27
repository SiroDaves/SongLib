import 'package:drift/drift.dart';

import '../../exports.dart';

part 'listed_dao_storage.g.dart';

abstract class ListedDaoStorage {
  factory ListedDaoStorage(MyDatabase db) = _ListedDaoStorage;

  Stream<List<DbListed>> getAllListedsStream();

  Future<List<Listed>> getAllListeds();

  Future<void> createListed(Listed listed);

  Future<void> createListedWithValue(Listed listed);

  Future<void> updateListed(Listed listed);
}

@DriftAccessor(tables: [
  DbListedTable,
])
class _ListedDaoStorage extends DatabaseAccessor<MyDatabase>
    with _$_ListedDaoStorageMixin
    implements ListedDaoStorage {
  _ListedDaoStorage(MyDatabase db) : super(db);

  @override
  Future<List<Listed>> getAllListeds() async {
    List<DbListed> dbListeds = await select(db.dbListedTable).get();
    List<Listed> listeds = [];

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
  Stream<List<DbListed>> getAllListedsStream() => select(db.dbListedTable).watch();

  @override
  Future<void> createListed(Listed listed) => into(db.dbListedTable).insert(
        DbListedTableCompanion.insert(
          objectId: listed.objectId!,
          parentid: Value(listed.parentid!),
          title: listed.title!,
          description: listed.description!,
          position: Value(listed.position!),
          createdAt: Value(listed.createdAt!),
          updatedAt: Value(listed.updatedAt!),
        ),
      );

  @override
  Future<void> createListedWithValue(Listed listed) async =>
      into(db.dbListedTable).insert(
        DbListedTableCompanion.insert(
          objectId: listed.objectId!,
          parentid: Value(listed.parentid!),
          title: listed.title!,
          description: listed.description!,
          position: Value(listed.position!),
          createdAt: Value(listed.createdAt!),
          updatedAt: Value(listed.updatedAt!),
        ),
      );

  @override
  Future<void> updateListed(Listed listed) =>
      (update(db.dbListedTable)..where((row) => row.id.equals(listed.id))).write(
        DbListedTableCompanion(
          parentid: Value(listed.parentid!),
          title: Value(listed.title!),
          description: Value(listed.description!),
          position: Value(listed.position!),
          updatedAt: Value(listed.updatedAt!),
        ),
      );
}
