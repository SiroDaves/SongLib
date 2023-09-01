import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/draft.dart';
import '../../model/tables/drafts_table.dart';
import '../../utils/utilities.dart';
import '../app_database.dart';

part 'draft_dao.g.dart';

@lazySingleton
abstract class DraftDao {
  @factoryMethod
  factory DraftDao(AppDatabase db) = _DraftDao;

  Future<List<Draft>> getAllDrafts();
  Future<void> createDraft({required Draft draft, bool isSimple = true});
  Future<void> updateDraft(Draft draft);
  Future<void> deleteDraft(Draft draft);
}

@DriftAccessor(tables: [
  DraftsTable,
])
class _DraftDao extends DatabaseAccessor<AppDatabase>
    with _$_DraftDaoMixin
    implements DraftDao {
  _DraftDao(AppDatabase db) : super(db);

  @override
  Future<List<Draft>> getAllDrafts() async {
    return await customSelect(
      'SELECT * FROM ${db.draftsTable.actualTableName} '
      'ORDER BY ${db.draftsTable.id.name} DESC;',
      readsFrom: {db.draftsTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => Draft.fromData(row.data)).toList();
      },
    ).first;
  }

  @override
  Future<int> createDraft({required Draft draft, bool isSimple = true}) async {
    return await into(db.draftsTable).insert(
      DraftsTableCompanion.insert(
        draftId: isSimple ? const Value.absent() : Value(draft.draftId!),
        book: isSimple ? const Value.absent() : Value(draft.book!),
        songNo: isSimple ? const Value.absent() : Value(draft.songNo!),
        title: Value(draft.title!),
        alias: Value(draft.alias!),
        content: Value(draft.content!),
        key: Value(draft.key!),
        author: isSimple ? const Value.absent() : Value(draft.author!),
        views: isSimple ? const Value.absent() : Value(draft.views!),
        created: isSimple ? Value(dateNow()) : Value(draft.created!),
        updated: isSimple ? const Value.absent() : Value(draft.updated!),
        liked: isSimple ? const Value.absent() : Value(draft.liked!),
      ),
    );
  }

  @override
  Future<void> updateDraft(Draft draft) =>
      (update(db.draftsTable)..where((row) => row.id.equals(draft.id))).write(
        DraftsTableCompanion(
          book: Value(draft.book!),
          songNo: Value(draft.songNo!),
          title: Value(draft.title!),
          alias: Value(draft.alias!),
          content: Value(draft.content!),
          key: Value(draft.key!),
          author: Value(draft.author!),
          views: Value(draft.views!),
          updated: Value(draft.updated!),
          liked: Value(draft.liked!),
        ),
      );

  @override
  Future<void> deleteDraft(Draft draft) =>
      (delete(db.draftsTable)..where((row) => row.id.equals(draft.id))).go();
}
