import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/draft.dart';
import '../../model/tables/db_draft_table.dart';
import '../../util/constants/utilities.dart';
import '../songlib_db.dart';

part 'draft_dao_storage.g.dart';

@lazySingleton
abstract class DraftDaoStorage {
  @factoryMethod
  factory DraftDaoStorage(SongLibDb db) = _DraftDaoStorage;

  Future<List<Draft>> getAllDrafts();
  Future<void> createDraft({required Draft draft, bool isSimple = true});
  Future<void> updateDraft(Draft draft);
  Future<void> deleteDraft(Draft draft);
}

@DriftAccessor(tables: [
  DbDraftTable,
])
class _DraftDaoStorage extends DatabaseAccessor<SongLibDb>
    with _$_DraftDaoStorageMixin
    implements DraftDaoStorage {
  _DraftDaoStorage(SongLibDb db) : super(db);

  @override
  Future<List<Draft>> getAllDrafts() async {
    final Stream<List<Draft>> streams = customSelect(
      'SELECT * FROM ${db.dbDraftTable.actualTableName} '
      'ORDER BY ${db.dbDraftTable.id.name} DESC;',
      readsFrom: {db.dbDraftTable},
    ).watch().map(
      (rows) {
        final List<Draft> drafts = [];
        for (final row in rows) {
          drafts.add(
            Draft(
              id: const IntType().mapFromDatabaseResponse(row.data['id'])!,
              objectId: const StringType()
                  .mapFromDatabaseResponse(row.data['object_id'])!,
              book: const IntType().mapFromDatabaseResponse(row.data['book'])!,
              songNo:
                  const IntType().mapFromDatabaseResponse(row.data['song_no'])!,
              title: const StringType()
                  .mapFromDatabaseResponse(row.data['title'])!,
              alias: const StringType()
                  .mapFromDatabaseResponse(row.data['alias'])!,
              content: const StringType()
                  .mapFromDatabaseResponse(row.data['content'])!,
              key: const StringType().mapFromDatabaseResponse(row.data['key'])!,
              author: const StringType()
                  .mapFromDatabaseResponse(row.data['author'])!,
              views:
                  const IntType().mapFromDatabaseResponse(row.data['views'])!,
              createdAt: const StringType()
                  .mapFromDatabaseResponse(row.data['created_at'])!,
              updatedAt: const StringType()
                  .mapFromDatabaseResponse(row.data['updated_at'])!,
              liked:
                  const BoolType().mapFromDatabaseResponse(row.data['liked'])!,
            ),
          );
        }
        return drafts;
      },
    );
    return await streams.first;
  }

  @override
  Future<int> createDraft({required Draft draft, bool isSimple = true}) async {
    return await into(db.dbDraftTable).insert(
      DbDraftTableCompanion.insert(
        objectId: isSimple ? const Value.absent() : Value(draft.objectId!),
        book: isSimple ? const Value.absent() : Value(draft.book!),
        songNo: isSimple ? const Value.absent() : Value(draft.songNo!),
        title: Value(draft.title!),
        alias: Value(draft.alias!),
        content: Value(draft.content!),
        key: Value(draft.key!),
        author: isSimple ? const Value.absent() : Value(draft.author!),
        views: isSimple ? const Value.absent() : Value(draft.views!),
        createdAt: isSimple ? Value(dateNow()) : Value(draft.createdAt!),
        updatedAt: isSimple ? const Value.absent() : Value(draft.updatedAt!),
        liked: isSimple ? const Value.absent() : Value(draft.liked!),
      ),
    );
  }

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

  @override
  Future<void> deleteDraft(Draft draft) =>
      (delete(db.dbDraftTable)..where((row) => row.id.equals(draft.id))).go();
}
