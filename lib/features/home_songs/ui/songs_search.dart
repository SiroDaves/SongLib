import 'package:flutter/material.dart';

import '../../../common/data/models/models.dart';
import '../../../common/widgets/list_items/search_book_item.dart';
import '../../../common/widgets/list_items/search_song_item.dart';
import '../../../core/theme/theme_data.dart';
import '../../../core/theme/theme_styles.dart';
import '../../presentor/ui/presentor_screen.dart';
import '../../home/bloc/home_bloc.dart';
import '../utils/search_songs_utils.dart';

/// Small screen search
class SongsSearch extends SearchDelegate<List> {
  final HomeBloc? bloc;
  final double? height;
  Book setBook = Book();
  SongsSearch(BuildContext context, this.bloc, this.height);

  @override
  String get searchFieldLabel => "Search a Song";

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? AppTheme.lightTheme()
        : AppTheme.darkTheme();
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
    var matchQuery = filterSongsByQry(query.toLowerCase(), bloc!.state.songs);
    List<Widget> bookItems = <Widget>[
      SearchBookItem(text: 'All', isSelected: true, onPressed: () {}),
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

    ScrollController scrollController = ScrollController();
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
          child: Container(
            padding: const EdgeInsets.only(right: Sizes.xs),
            child: Scrollbar(
              thickness: Sizes.m,
              thumbVisibility: true,
              radius: const Radius.circular(Sizes.sm),
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: Sizes.xs, right: Sizes.m),
                itemCount: matchQuery.length,
                itemBuilder: (context, index) {
                  final SongExt result = matchQuery[index];
                  return SearchSongItem(
                    song: result,
                    height: height!,
                    isSearching: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PresentorScreen(song: result),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
