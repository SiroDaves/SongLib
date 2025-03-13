import '../../../core/utils/app_util.dart';
import '../../../data/models/songext.dart';

List<SongExt> filterSongsByQuery(String query, List<SongExt> songs) {
  try {
    return songs.where((song) {
      // Check if the song number matches the query (if query is numeric)
      if (isNumeric(query) && song.songNo == int.parse(query)) {
        return true;
      }

      // Create a regular expression pattern to match "," and "!" characters
      RegExp charsPtn = RegExp(r'[!,]');

      // Split the query into words if it contains commas
      List<String> words;
      if (query.contains(',')) {
        words = query.split(',');
        // Trim whitespace from each word
        words = words.map((w) => w.trim()).toList();
      } else {
        words = [query];
      }

      // Create a regular expression pattern to match the words in the query
      RegExp queryPtn = RegExp(words.map((w) => '($w)').join('.*'));

      String title = song.title.replaceAll(charsPtn, '').toLowerCase();
      String alias = song.alias.replaceAll(charsPtn, '').toLowerCase();
      String content = song.content.replaceAll(charsPtn, '').toLowerCase();

      if (song.title.isNotEmpty && queryPtn.hasMatch(title)) {
        return true;
      }

      if (song.alias.isNotEmpty && queryPtn.hasMatch(alias)) {
        return true;
      }

      if (song.content.isNotEmpty && queryPtn.hasMatch(content)) {
        return true;
      }

      return false;
    }).toList();
  } catch (error) {
    rethrow;
  }
}
