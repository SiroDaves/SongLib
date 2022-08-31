import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/book.dart';
import '../../model/tables/db_book_table.dart';
import '../songlib_db.dart';

part 'book_dao_storage.g.dart';

@lazySingleton
abstract class BookDaoStorage {
  @factoryMethod
  factory BookDaoStorage(SongLibDb db) = _BookDaoStorage;

  Future<List<Book>> getAllBooks();

  Future<void> createBook(Book book);

  Future<void> updateBook(Book book);

  Future<void> deleteBook(Book book);

  Future<void> deleteBooks();
}

@DriftAccessor(tables: [
  DbBookTable,
])
class _BookDaoStorage extends DatabaseAccessor<SongLibDb>
    with _$_BookDaoStorageMixin
    implements BookDaoStorage {
  _BookDaoStorage(SongLibDb db) : super(db);

  @override
  Future<List<Book>> getAllBooks() async {
    final Stream<List<Book>> streams = customSelect(
      'SELECT * FROM ${db.dbBookTable.actualTableName} '
      'ORDER BY ${db.dbBookTable.position.name} ASC;',
      readsFrom: {db.dbBookTable},
    ).watch().map(
      (rows) {
        final List<Book> drafts = [];
        for (final row in rows) {
          drafts.add(
            Book(
              id: const IntType().mapFromDatabaseResponse(row.data['id'])!,
              objectId: const StringType()
                  .mapFromDatabaseResponse(row.data['object_id'])!,
              enabled: const BoolType()
                  .mapFromDatabaseResponse(row.data['enabled'])!,
              bookNo:
                  const IntType().mapFromDatabaseResponse(row.data['book_no'])!,
              title: const StringType()
                  .mapFromDatabaseResponse(row.data['title'])!,
              subTitle: const StringType()
                  .mapFromDatabaseResponse(row.data['sub_title'])!,
              songs:
                  const IntType().mapFromDatabaseResponse(row.data['songs'])!,
              position: const IntType()
                  .mapFromDatabaseResponse(row.data['position'])!,
              createdAt: const StringType()
                  .mapFromDatabaseResponse(row.data['created_at'])!,
              updatedAt: const StringType()
                  .mapFromDatabaseResponse(row.data['updated_at'])!,
            ),
          );
        }
        return drafts;
      },
    );
    return await streams.first;
  }

  @override
  Future<void> createBook(Book book) => into(db.dbBookTable).insert(
        DbBookTableCompanion.insert(
          objectId: Value(book.objectId!),
          bookNo: Value(book.bookNo!),
          enabled: Value(book.enabled!),
          title: Value(book.title!),
          subTitle: Value(book.subTitle!),
          songs: Value(book.songs!),
          position: Value(book.position!),
          createdAt: Value(book.createdAt!),
          updatedAt: Value(book.updatedAt!),
        ),
      );

  @override
  Future<void> updateBook(Book book) =>
      (update(db.dbBookTable)..where((row) => row.id.equals(book.id))).write(
        DbBookTableCompanion(
          bookNo: Value(book.bookNo!),
          enabled: Value(book.enabled!),
          title: Value(book.title!),
          subTitle: Value(book.subTitle!),
          songs: Value(book.songs!),
          position: Value(book.position!),
          updatedAt: Value(book.updatedAt!),
        ),
      );

  @override
  Future<void> deleteBook(Book book) =>
      (delete(db.dbBookTable)..where((row) => row.id.equals(book.id))).go();

  @override
  Future<void> deleteBooks() => (delete(db.dbBookTable)).go();
}
