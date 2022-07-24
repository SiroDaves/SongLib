import 'package:drift/drift.dart';

import '../../exports.dart';

part 'book_dao_storage.g.dart';

abstract class BookDaoStorage {
  factory BookDaoStorage(MyDatabase db) = _BookDaoStorage;

  Stream<List<DbBook>> getAllBooksStream();

  Future<List<Book>> getAllBooks();

  Future<void> createBook(Book book);

  Future<void> createBookWithValue(Book book);

  Future<void> updateBook(Book book);
}

@DriftAccessor(tables: [
  DbBookTable,
])
class _BookDaoStorage extends DatabaseAccessor<MyDatabase>
    with _$_BookDaoStorageMixin
    implements BookDaoStorage {
  _BookDaoStorage(MyDatabase db) : super(db);

  @override
  Future<List<Book>> getAllBooks() async {
    List<DbBook> dbBooks = await select(db.dbBookTable).get();
    List<Book> books = [];

    for (int i = 0; i < dbBooks.length; i++) {
      books.add(
        Book(
          id: dbBooks[i].id,
          objectId: dbBooks[i].objectId,
          bookid: dbBooks[i].bookid,
          enabled: dbBooks[i].enabled,
          title: dbBooks[i].title,
          subtitle: dbBooks[i].subtitle,
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
          objectId: book.objectId,
          bookid: Value(book.bookid),
          enabled: Value(book.enabled),
          title: book.title,
          subtitle: book.subtitle,
          songs: Value(book.songs),
          position: Value(book.position),
          createdAt: book.createdAt,
          updatedAt: book.updatedAt,
        ),
      );

  @override
  Future<void> createBookWithValue(Book book) async =>
      into(db.dbBookTable).insert(
        DbBookTableCompanion.insert(
          objectId: book.objectId,
          bookid: Value(book.bookid),
          enabled: Value(book.enabled),
          title: book.title,
          subtitle: book.subtitle,
          songs: Value(book.songs),
          position: Value(book.position),
          createdAt: book.createdAt,
          updatedAt: book.updatedAt,
        ),
      );

  @override
  Future<void> updateBook(Book book) =>
      (update(db.dbBookTable)..where((row) => row.id.equals(book.id))).write(
        DbBookTableCompanion(
          bookid: Value(book.bookid),
          enabled: Value(book.enabled),
          title: Value(book.title),
          subtitle: Value(book.subtitle),
          songs: Value(book.songs),
          position: Value(book.position),
          updatedAt: Value(book.updatedAt),
        ),
      );
}
