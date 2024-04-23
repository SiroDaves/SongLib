import '../models/book.dart';

abstract class DatabaseRepository {
  Future<List<Book>> getSavedBooks();

  Future<void> saveBook(Book book);

  Future<void> removeBook(Book book);

  Future<void> removeAllBooks();
}
