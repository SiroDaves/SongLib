import 'package:drift/drift.dart';

import '../../model/base/book.dart';
import '../../model/database/db_book_table.dart';
import '../songlib_database.dart';

part 'book_dao_storage.g.dart';

abstract class BookDaoStorage {
  factory BookDaoStorage(SongLibDatabase db) = _BookDaoStorage;

  Stream<List<DbBook>> getAllBooksStream();

  Future<List<Book>> getAllBooks();

  Future<void> createBook(Book book);

  Future<void> updateBook(Book book);
}

@DriftAccessor(tables: [
  DbBookTable,
])
class _BookDaoStorage extends DatabaseAccessor<SongLibDatabase>
    with _$_BookDaoStorageMixin
    implements BookDaoStorage {
  _BookDaoStorage(SongLibDatabase db) : super(db);

  @override
  Future<List<Book>> getAllBooks() async {
    List<DbBook> dbBooks = await select(db.dbBookTable).get();
    List<Book> books = [];

    for (int i = 0; i < dbBooks.length; i++) {
      books.add(
        Book(
          id: dbBooks[i].id,
          objectId: dbBooks[i].objectId,
          bookNo: dbBooks[i].bookNo,
          enabled: dbBooks[i].enabled,
          title: dbBooks[i].title,
          subTitle: dbBooks[i].subTitle,
          songs: dbBooks[i].songs,
          position: dbBooks[i].position,
          createdAt: dbBooks[i].createdAt,
          updatedAt: dbBooks[i].updatedAt,
        ),
      );
    }
    return books;
  }

  @override
  Stream<List<DbBook>> getAllBooksStream() => select(db.dbBookTable).watch();

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
}
