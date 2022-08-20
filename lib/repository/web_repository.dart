import 'package:injectable/injectable.dart';

import '../model/base/book.dart';
import '../model/base/song.dart';
import '../webservice/web_service.dart';

@lazySingleton
abstract class WebRepository {
  @factoryMethod
  factory WebRepository(WebService webService) = WebRepo;

  Future<List<Book>> fetchBooks();
  Future<List<Song>> fetchSongs(String selectedBooks);
}

class WebRepo implements WebRepository {
  final WebService webService;

  WebRepo(this.webService);

  @override
  Future<List<Book>> fetchBooks() async {
    final response = await webService.getBooksResponse();
    return response!.results!;
  }

  @override
  Future<List<Song>> fetchSongs(String selectedBooks) async {
    final response =
        await webService.getSongsResponse('{"book":{"\$in":[$selectedBooks]}}');
    return response!.results!;
  }
}
