import 'package:injectable/injectable.dart';

import '../db/dao/book_dao_storage.dart';
import '../model/base/book.dart';
import '../webservice/web_service.dart';

@lazySingleton
abstract class BookRepository {
  @factoryMethod
  factory BookRepository(
    BookDaoStorage storage,
    WebService service,
  ) = BookRepo;

  Future<List<Book>> fetchBooks();

  Future<void> saveBook(Book book);
}

class BookRepo implements BookRepository {
  final BookDaoStorage bookDao;
  final WebService webService;

  BookRepo(this.bookDao, this.webService);

  @override
  Future<List<Book>> fetchBooks() async {
    List<Book> books = [];
    final response = await webService.getBooksResponse();
    /*for (final book in results!) {
      await bookDao.createBook(book);
    }*/
    if (response != null) {
      books = response.results!;
    }
    return books;
  }

  @override
  Future<void> saveBook(Book book) async {
    await bookDao.createBook(book);
  }
}
