import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/edit.dart';
import '../../model/tables/edits_table.dart';
import '../../utils/utilities.dart';
import '../app_database.dart';

part 'edit_dao.g.dart';

@lazySingleton
abstract class EditDao {
  @factoryMethod
  factory EditDao(AppDatabase db) = _EditDao;

  Future<List<Edit>> getAllEdits();
  Future<void> createEdit(Edit edit);
  Future<void> deleteEdit(Edit edit);
}

@DriftAccessor(tables: [
  EditsTable,
])
class _EditDao extends DatabaseAccessor<AppDatabase>
    with _$_EditDaoMixin
    implements EditDao {
  _EditDao(AppDatabase db) : super(db);

  @override
  Future<List<Edit>> getAllEdits() async {
    final List<Edits> results = await select(db.editsTable).get();
    return results
        .map(
          (result) => Edit(
            id: const IntType().mapFromDatabaseResponse(result.id)!,
            editId: const IntType().mapFromDatabaseResponse(result.editId)!,
            song:
                const StringType().mapFromDatabaseResponse(result.song)!,
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
  }

  @override
  Future<void> createEdit(Edit edit) => into(db.editsTable).insert(
        EditsTableCompanion.insert(
          song: Value(edit.song!),
          book: Value(edit.book!),
          title: Value(edit.title!),
          alias: Value(edit.alias!),
          content: Value(edit.content!),
          key: Value(edit.key!),
          created: Value(dateNow()),
        ),
      );

  @override
  Future<void> deleteEdit(Edit edit) =>
      (delete(db.editsTable)..where((row) => row.id.equals(edit.id))).go();
}
