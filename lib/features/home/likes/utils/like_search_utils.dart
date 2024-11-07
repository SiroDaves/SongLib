import '../../../../common/utils/app_util.dart';
import '../../../../common/data/models/songext.dart';

List<SongExt> filterLikesByQry(String query, List<SongExt> likes) {
  return likes.where((s) {
    // Check if the song number matches the query (if query is numeric)
    if (isNumeric(query) && s.songNo == int.parse(query)) {
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

    // Remove "," and "!" characters from s.title, s.alias, and s.content
    String title = s.title.replaceAll(charsPtn, '').toLowerCase();
    String alias = s.alias.replaceAll(charsPtn, '').toLowerCase();
    String content = s.content.replaceAll(charsPtn, '').toLowerCase();

    // Check if the song title matches the query, ignoring "," and "!" characters
    if (queryPtn.hasMatch(title)) {
      return true;
    }

    // Check if the song alias matches the query, ignoring "," and "!" characters
    if (queryPtn.hasMatch(alias)) {
      return true;
    }

    // Check if the song content matches the query, ignoring "," and "!" characters
    if (queryPtn.hasMatch(content)) {
      return true;
    }

    return false;
  }).toList();
}
