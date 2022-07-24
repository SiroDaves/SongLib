import '../../exports.dart';

abstract class BookService {
  Future<List<Book>> getBooks();
}
