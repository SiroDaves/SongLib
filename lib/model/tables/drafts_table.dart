import 'package:drift/drift.dart';

import '../../db/app_database.dart';
import '../base/draft.dart';

@DataClassName('Drafts')
class DraftsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get draftId => integer().withDefault(const Constant(0))();
  IntColumn get book => integer().withDefault(const Constant(0))();
  IntColumn get songNo => integer().withDefault(const Constant(0))();
  TextColumn get title => text().withDefault(const Constant(''))();
  TextColumn get alias => text().withDefault(const Constant(''))();
  TextColumn get content => text().withDefault(const Constant(''))();
  TextColumn get key => text().withDefault(const Constant(''))();
  TextColumn get author => text().withDefault(const Constant(''))();
  IntColumn get views => integer().withDefault(const Constant(0))();
  TextColumn get created => text().withDefault(const Constant(''))();
  TextColumn get updated => text().withDefault(const Constant(''))();
  BoolColumn get liked => boolean().withDefault(const Constant(false))();
}

extension DraftsExtension on Drafts {
  Draft getModel() => Draft(
        id: id,
        draftId: draftId,
        book: book,
        songNo: songNo,
        title: title,
        alias: alias,
        content: content,
        key: key,
        author: author,
        views: views,
        created: created,
        updated: updated,
        liked: liked,
      );
}

extension DraftExtension on Draft {
  DraftsTableCompanion getDbModel() {
    final id = this.id;
    return DraftsTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
          draftId: Value(draftId!),
          book: Value(book!),
          songNo: Value(songNo!),
          title: Value(title!),
          alias: Value(alias!),
          content: Value(content!),
          author: Value(author!),
          key: Value(key!),
          created: Value(created!),
          updated: Value(updated!),
          liked: Value(liked!),
    );
  }
}
