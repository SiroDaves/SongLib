import '../../data/models/songext.dart';

List<SongExt> sortSongsByBook(SongExtSort songExtSort) {
  return songExtSort.songs.where((s) => s.book == songExtSort.bookNo).toList();
}
