import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:songlib/util/constants/utilities.dart';

import '../../model/base/draft.dart';
import '../../model/tables/db_draft_table.dart';
import '../songlib_db.dart';

part 'draft_dao_storage.g.dart';

@lazySingleton
abstract class DraftDaoStorage {
  @factoryMethod
  factory DraftDaoStorage(SongLibDb db) = _DraftDaoStorage;

  Future<List<Draft>> getAllDrafts();

  Future<void> createDraft({required Draft draft, bool isSimple = true});

  Future<void> updateDraft(Draft draft);
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
        for (int i = 0; i < rows.length; i++) {
          drafts.add(
            Draft(
              id: const IntType().mapFromDatabaseResponse(rows[i].data['id'])!,
              objectId: const StringType()
                  .mapFromDatabaseResponse(rows[i].data['object_id'])!,
              book: const IntType()
                  .mapFromDatabaseResponse(rows[i].data['book'])!,
              songNo: const IntType()
                  .mapFromDatabaseResponse(rows[i].data['song_no'])!,
              title: const StringType()
                  .mapFromDatabaseResponse(rows[i].data['title'])!,
              alias: const StringType()
                  .mapFromDatabaseResponse(rows[i].data['alias'])!,
              content: const StringType()
                  .mapFromDatabaseResponse(rows[i].data['content'])!,
              key: const StringType()
                  .mapFromDatabaseResponse(rows[i].data['key'])!,
              author: const StringType()
                  .mapFromDatabaseResponse(rows[i].data['author'])!,
              views: const IntType()
                  .mapFromDatabaseResponse(rows[i].data['views'])!,
              createdAt: const StringType()
                  .mapFromDatabaseResponse(rows[i].data['created_at'])!,
              updatedAt: const StringType()
                  .mapFromDatabaseResponse(rows[i].data['updated_at'])!,
              liked: const BoolType()
                  .mapFromDatabaseResponse(rows[i].data['liked'])!,
            ),
          );
        }
        return drafts;
      },
    );
    return await streams.first;
  }

  @override
  Future<void> createDraft({required Draft draft, bool isSimple = true}) =>
      into(db.dbDraftTable).insert(
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
