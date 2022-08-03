import 'package:drift/drift.dart';

import '../../model/base/draft.dart';
import '../../model/database/db_draft_table.dart';
import '../songlib_database.dart';

part 'draft_dao_storage.g.dart';

abstract class DraftDaoStorage {
  factory DraftDaoStorage(SongLibDatabase db) = _DraftDaoStorage;

  Stream<List<DbDraft>> getAllDraftsStream();

  Future<List<Draft>> getAllDrafts();

  Future<void> createDraft(Draft draft);

  Future<void> updateDraft(Draft draft);
}

@DriftAccessor(tables: [
  DbDraftTable,
])
class _DraftDaoStorage extends DatabaseAccessor<SongLibDatabase>
    with _$_DraftDaoStorageMixin
    implements DraftDaoStorage {
  _DraftDaoStorage(SongLibDatabase db) : super(db);

  @override
  Future<List<Draft>> getAllDrafts() async {
    List<DbDraft> dbdrafts = await select(db.dbDraftTable).get();
    List<Draft> drafts = [];

    for (int i = 0; i < dbdrafts.length; i++) {
      drafts.add(
        Draft(
          id: dbdrafts[i].id,
          objectId: dbdrafts[i].objectId,
          book: dbdrafts[i].book,
          songNo: dbdrafts[i].songNo,
          title: dbdrafts[i].title,
          alias: dbdrafts[i].alias,
          content: dbdrafts[i].content,
          author: dbdrafts[i].author,
          key: dbdrafts[i].key,
          views: dbdrafts[i].views,
          createdAt: dbdrafts[i].createdAt,
          updatedAt: dbdrafts[i].updatedAt,
        ),
      );
    }
    return drafts;
  }

  @override
  Stream<List<DbDraft>> getAllDraftsStream() => select(db.dbDraftTable).watch();

  @override
  Future<void> createDraft(Draft draft) => into(db.dbDraftTable).insert(
        DbDraftTableCompanion.insert(
          objectId: Value(draft.objectId!),
          book: Value(draft.book!),
          songNo: Value(draft.songNo!),
          title: Value(draft.title!),
          alias: Value(draft.alias!),
          content: Value(draft.content!),
          key: Value(draft.key!),
          author: Value(draft.author!),
          views: Value(draft.views!),
          createdAt: Value(draft.createdAt!),
          updatedAt: Value(draft.updatedAt!),
          liked: Value(draft.liked!),
        ),
      );

  @override
  Future<void> updateDraft(Draft draft) =>
      (update(db.dbDraftTable)..where((row) => row.id.equals(draft.id))).write(
        DbDraftTableCompanion(
          book: Value(draft.book!),
          songNo: Value(draft.songNo!),
          title: Value(draft.title!),
          alias: Value(draft.alias!),
          content: Value(draft.content!),
          key: Value(draft.key!),
          author: Value(draft.author!),
          views: Value(draft.views!),
          updatedAt: Value(draft.updatedAt!),
          liked: Value(draft.liked!),
        ),
      );
}
