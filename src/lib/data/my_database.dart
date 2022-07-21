import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import '../exports.dart';

part 'my_database.g.dart';

@DriftDatabase(tables: [TbBooks, TbSongs])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(NativeDatabase.memory());

  MyDatabase.connect(DatabaseConnection connection) : super.connect(connection);

  @override
  int get schemaVersion => 1;

  /// Fetch a list of books from the database
  Future<List<Book>> bookList() async {
    List<TbBook> tbbooks = await select(tbBooks).get();
    List<Book> books = [];

    for (int i = 0; i < tbbooks.length; i++) {
      TbBook tbBook = tbbooks[i];
      books.add(
        Book(
          objectId: tbBook.objectId,
          bookid: tbBook.bookid,
          enabled: tbBook.enabled,
          title: tbBook.title,
          subtitle: tbBook.subtitle,
          songs: tbBook.songs,
          position: tbBook.position,
          createdAt: tbBook.createdAt,
          updatedAt: tbBook.updatedAt,
        ),
      );
    }
    return books;
  }

  /// Add the books selected into the database
  Future<void> saveBooks(List<Listed<Book>?> books) async {
    for (int i = 0; i < books.length; i++) {
      Book book = books[i]!.data;
      into(tbBooks).insert(
        TbBooksCompanion(
          objectId: Value(book.objectId!),
          bookid: Value(book.bookid!),
          enabled: Value(book.enabled!),
          title: Value(book.title!),
          subtitle: Value(book.subtitle!),
          songs: Value(book.songs!),
          position: Value(book.position!),
          createdAt: Value(book.createdAt!),
          updatedAt: Value(book.updatedAt!),
        ),
      );
    }
  }

  /// Fetch a list of songs from the database
  Future<List<Song>> songList() async {
    List<TbSong> tbsongs = await select(tbSongs).get();
    List<Song> songs = [];

    for (int i = 0; i < tbsongs.length; i++) {
      TbSong tbSong = tbsongs[i];
      songs.add(
        Song(
          objectId: tbSong.objectId,
          book: tbSong.book,
          songno: tbSong.songno,
          title: tbSong.title,
          alias: tbSong.alias,
          content: tbSong.content,
          author: tbSong.author,
          key: tbSong.key,
          createdAt: tbSong.createdAt,
          updatedAt: tbSong.updatedAt,
        ),
      );
    }
    return songs;
  }

  /// Add a song entry
  Future<int> saveNewSong(Song song) {
    return into(tbSongs).insert(
      TbSongsCompanion(
        objectId: Value(song.objectId!),
        book: Value(song.book!),
        songno: Value(song.songno!),
        title: Value(song.title!),
        alias: Value(song.alias!),
        content: Value(song.content!),
        author: Value(song.author!),
        key: Value(song.key!),
        createdAt: Value(song.createdAt!),
        updatedAt: Value(song.updatedAt!),
      ),
    );
  }

  /// Add the songs selected into the database
  Future<void> saveSongs(List<Song>? songs) async {
    for (int i = 0; i < songs!.length; i++) {
      Song song = songs[i];
      into(tbSongs).insert(
        TbSongsCompanion(
          objectId: Value(song.objectId!),
          book: Value(song.book!),
          songno: Value(song.songno!),
          title: Value(song.title!),
          alias: Value(song.alias!),
          content: Value(song.content!),
          author: Value(song.author!),
          key: Value(song.key!),
          createdAt: Value(song.createdAt!),
          updatedAt: Value(song.updatedAt!),
        ),
      );
    }
  }
}
