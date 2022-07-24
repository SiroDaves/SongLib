import '../exports.dart';

abstract class BookRepository {
  factory BookRepository(
    BookService service,
    BookDaoStorage storage,
  ) = _BookRepository;
    
  Stream<List<Book>> getBooks();

  Future<List<Book>> fetchBooks();

  Future<void> saveBook(Book book);

  Future<void> setBookState(Book book);
}

class _BookRepository implements BookRepository {
  final BookDaoStorage _bookDao;
  final BookService _bookService;

  _BookRepository(this._bookService, this._bookDao);

  @override
  Stream<List<Book>> getBooks() => _bookDao
      .getAllBooksStream()
      .map((list) => list.map((item) => item.getModel()).toList());

  @override
  Future<List<Book>> fetchBooks() async {
    final results = await _bookService.getBooks();
    for (final book in results) {
      await _bookDao.createBookWithValue(book);
    }
    return results;
  }

  @override
  Future<void> saveBook(Book book) async {
    await _bookDao.createBook(book);
  }

  @override
  Future<void> setBookState(Book book) async {
    await _bookDao.updateBook(book);
  }
}
