import '../models/book.dart';
import '../repository/db_repository.dart';
import 'app_database.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<List<Book>> getSavedBooks() async {
    return _appDatabase.bookDao.getAllBooks();
  }

  @override
  Future<void> removeBook(Book book) async {
    return _appDatabase.bookDao.deleteBook(book);
  }

  @override
  Future<void> saveBook(Book book) async {
    return _appDatabase.bookDao.insertBook(book);
  }

  @override
  Future<void> removeAllBooks() async {
    return _appDatabase.bookDao.deleteAllBooks();
  }
}
