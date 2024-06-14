import 'package:flutter/material.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../common/theme/theme_colors.dart';
import '../common/theme/theme_fonts.dart';
import '../common/theme/theme_styles.dart';
import '../common/utils/app_util.dart';
import '../common/widgets/list_items/search_book_item.dart';
import '../common/widgets/list_items/search_song_item.dart';
import '../data/models/book.dart';
import '../data/models/songext.dart';
import '../presentor/ui/presentor_screen.dart';
import '../home/bloc/home_bloc.dart';

/// Small screen search
class SearchSongs extends SearchDelegate<List> {
  final HomeBloc? bloc;
  final double? height;
  Book setBook = Book();
  SearchSongs(BuildContext context, this.bloc, this.height);

  @override
  String get searchFieldLabel => "Search a Song";

  @override
  ThemeData appBarTheme(BuildContext context) {
    Color foregroundColor = Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary
        : Colors.white;
    Color backgroundColor = Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Colors.black;
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: foregroundColor),
        elevation: 3,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyles.headingStyle2.textColor(foregroundColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyles.headingStyle2.textColor(foregroundColor),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, bloc!.state.songs),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) => searchThis(context);

  @override
  Widget buildSuggestions(BuildContext context) => searchThis(context);

  Widget searchThis(BuildContext context) {
    final qry = query.toLowerCase();

    List<SongExt> matchQuery = bloc!.state.songs.where((s) {
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
        words = [qry];
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

    List<Widget> bookItems = <Widget>[
      SearchBookItem(
        text: 'All',
        isSelected: true,
        onPressed: () {},
      ),
    ];
    for (var book in bloc!.state.books) {
      bookItems.add(
        SearchBookItem(
          text: book.title!,
          isSelected: setBook == book,
          onPressed: () {
            setBook == book;
          },
        ),
      );
    }

    // ignore: unused_local_variable
    var booksList = SizedBox(
      height: 40,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        children: bookItems,
      ),
    );

    return Column(
      children: [
        //booksList,
        Expanded(
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.xs),
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              final SongExt result = matchQuery[index];
              return SearchSongItem(
                song: result,
                height: height!,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PresentorScreen(
                        song: result,
                        books: bloc!.state.books,
                        songs: bloc!.state.songs,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
