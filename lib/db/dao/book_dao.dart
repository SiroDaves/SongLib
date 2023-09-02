import 'dart:developer' as logger show log;
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/book.dart';
import '../../model/tables/books_table.dart';
import '../app_database.dart';

part 'book_dao.g.dart';

@lazySingleton
abstract class BookDao {
  @factoryMethod
  factory BookDao(AppDatabase db) = _BookDao;

  Future<void> checkBooks();
  Future<List<Book>> getAllBooks();
  Future<void> createBook(Book book);
  Future<void> updateBook(Book book);
  Future<void> deleteBook(Book book);
  Future<void> deleteBooks();
}

@DriftAccessor(tables: [
  BooksTable,
])
class _BookDao extends DatabaseAccessor<AppDatabase>
    with _$_BookDaoMixin
    implements BookDao {
  _BookDao(AppDatabase db) : super(db);

  @override
  Future<void> checkBooks() async {
    logger.log('Checking for if tables exists as expected');
    try {
      await customSelect(
        'SELECT * FROM ${db.booksTable.actualTableName} '
        'ORDER BY ${db.booksTable.position.name} ASC;',
      ).watch().first;
      logger.log('${db.booksTable.actualTableName} table exists as expected');
    } catch (e) {
      logger.log(e.toString());
      try {
        await customStatement(
          'ALTER TABLE db_book_table '
          'RENAME TO ${db.booksTable.actualTableName};',
        );
        logger.log(
            'db_book_table renamed to ${db.booksTable.actualTableName} successfully');
      } catch (e) {
        logger.log(e.toString());
      }
    }
  }

  @override
  Future<List<Book>> getAllBooks() async {
    return await customSelect(
      'SELECT * FROM ${db.booksTable.actualTableName} '
      'ORDER BY ${db.booksTable.position.name} ASC;',
      readsFrom: {db.booksTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => Book.fromData(row.data)).toList();
      },
    ).first;
  }

  /*@override
  Future<void> createBook(Book book) => into(db.booksTable).insert(
        BooksTableCompanion.insert(
          bookId: Value(book.bookId!),
          bookNo: Value(book.bookNo!),
          enabled: Value(book.enabled!),
          title: Value(book.title!),
          subTitle: Value(book.subTitle!),
          songs: Value(book.songs!),
          position: Value(book.position!),
          created: Value(book.created!),
          updated: Value(book.updated!),
        ),
      );*/

  @override
  Future<int> createBook(Book book) async {
    int result = 0;
    String sqlString = "INSERT INTO ${db.booksTable.actualTableName} "
        "(${db.booksTable.bookId.name}, ${db.booksTable.bookNo.name}, ${db.booksTable.enabled.name}, ${db.booksTable.title.name}, "
        "${db.booksTable.subTitle.name}, ${db.booksTable.songs.name}, ${db.booksTable.position.name}, ${db.booksTable.created.name}, ${db.booksTable.updated.name}) "
        "VALUES (${book.bookId}, ${book.bookNo}, ${book.enabled}, ${book.title}, ${book.subTitle}, ${book.songs}, ${book.position}, ${book.created}, ${book.updated});";
    logger.log('Generated SQL: $sqlString');
    try {
      final sqlStatement = BooksTableCompanion.insert(
        bookId: Value(book.bookId!),
        bookNo: Value(book.bookNo!),
        enabled: Value(book.enabled!),
        title: Value(book.title!),
        subTitle: Value(book.subTitle!),
        songs: Value(book.songs!),
        position: Value(book.position!),
        created: Value(book.created!),
        updated: Value(book.updated ?? ''),
      );
      result = await into(db.booksTable).insert(sqlStatement);
    } catch (e) {
      logger.log(e.toString());
    }
    return result;
  }

  @override
  Future<void> updateBook(Book book) =>
      (update(db.booksTable)..where((row) => row.id.equals(book.id))).write(
        BooksTableCompanion(
          bookNo: Value(book.bookNo!),
          enabled: Value(book.enabled!),
          title: Value(book.title!),
          subTitle: Value(book.subTitle!),
          songs: Value(book.songs!),
          position: Value(book.position!),
          updated: Value(book.updated!),
        ),
      );

  @override
  Future<void> deleteBook(Book book) =>
      (delete(db.booksTable)..where((row) => row.id.equals(book.id))).go();

  @override
  Future<void> deleteBooks() => (delete(db.booksTable)).go();
}
