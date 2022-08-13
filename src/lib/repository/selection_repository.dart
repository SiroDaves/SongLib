import 'package:injectable/injectable.dart';

import '../db/dao/book_dao_storage.dart';
import '../db/dao/song_dao_storage.dart';
import '../model/base/book.dart';
import '../model/base/song.dart';
import '../webservice/web_service.dart';

@lazySingleton
abstract class SelectionRepository {
  @factoryMethod
  factory SelectionRepository(
    BookDaoStorage bookStorage,
    SongDaoStorage songStorage,
    WebService webService,
  ) = SelectionRepo;

  Future<List<Book>> fetchBooks();

  Future<void> saveBook(Book book);

  Future<List<Song>> fetchSongs(String selectedBooks);

  Future<void> saveSong(Song song);
}

class SelectionRepo implements SelectionRepository {
  final BookDaoStorage bookDao;
  final SongDaoStorage songDao;
  final WebService webService;

  SelectionRepo(this.bookDao, this.songDao, this.webService);

  @override
  Future<List<Book>> fetchBooks() async {
    final response = await webService.getBooksResponse();
    return response!.results!;
  }

  @override
  Future<void> saveBook(Book book) async {
    await bookDao.createBook(book);
  }

  @override
  Future<List<Song>> fetchSongs(String selectedBooks) async {
    List<Song> songs = [];
    final response = await webService.getSongsResponse(
      '{"book":{"\$in":[$selectedBooks]}}',
    );
    if (response != null) {
      songs = response.results!;
    }
    return songs;
  }

  @override
  Future<void> saveSong(Song song) async {
    await songDao.createSong(song);
  }
}
