import '../../model/webservice/books_response.dart';

// ignore: one_member_abstracts
abstract class BookService {
  Future<BooksResponse?> getBooksResponse();
}
