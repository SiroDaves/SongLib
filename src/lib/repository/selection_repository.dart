import 'package:injectable/injectable.dart';

import '../database/dao/book_dao_storage.dart';
import '../database/dao/song_dao_storage.dart';
import '../model/base/book.dart';
import '../model/base/song.dart';
import '../webservice/book/book_service.dart';
import '../webservice/song/song_service.dart';

@lazySingleton
abstract class SelectionRepository {
  @factoryMethod
  factory SelectionRepository(
    BookService bookService,
    BookDaoStorage bookStorage,
    SongService songService,
    SongDaoStorage SongStorage,
  ) = SelectionRepo;

  Future<List<Book>> fetchBooks();

  Future<void> saveBook(Book book);

  Future<List<Song>> fetchSongs(String selectedBooks);

  Future<void> saveSong(Song song);
}

class SelectionRepo implements SelectionRepository {
  final BookDaoStorage bookDao;
  final BookService bookService;
  final SongDaoStorage songDao;
  final SongService songService;

  SelectionRepo(this.bookService, this.bookDao, this.songService, this.songDao);

  @override
  Future<List<Book>> fetchBooks() async {
    List<Book> books = [];
    final response = await bookService.getBooksResponse();
    if (response != null) {
      books = response.results!;
    }
    return books;
  }

  @override
  Future<void> saveBook(Book book) async {
    await bookDao.createBook(book);
  }

  @override
  Future<List<Song>> fetchSongs(String selectedBooks) async {
    List<Song> songs = [];
    final response = await songService.getSongsResponse(
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
