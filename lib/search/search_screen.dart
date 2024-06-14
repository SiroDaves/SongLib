import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/widgets/list_items/search_book_item.dart';
import '../common/widgets/list_items/search_song_item.dart';
import '../data/models/book.dart';
import '../data/models/songext.dart';
import '../home/bloc/home_bloc.dart';
import '../home/ui/home_screen.dart';
import '../presentor/ui/presentor_screen.dart';

part 'search_screen_widgets.dart';

class SearchScreen extends StatefulWidget {
  final HomeScreenBodyState parent;
  const SearchScreen({super.key, required this.parent});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  late HomeScreenBodyState parent;
  int setBook = 0, setSong = 0;
  List<SongExt> filtered = [];

  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  void sortSongs(List<SongExt> songs, int bookNo) async {
    var tempList = await compute(
      sortSongsByBook,
      SongExtSort(bookNo, songs),
    );
    setState(() => filtered = tempList);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 200) {
        if (!_showBackToTopButton) {
          setState(() {
            _showBackToTopButton = true;
          });
        }
      } else {
        if (_showBackToTopButton) {
          setState(() {
            _showBackToTopButton = false;
          });
        }
      }
    });
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: parent.bloc,
      listener: (context, state) {
        if (state.status == Status.loaded) {
          setState(() => setBook = 0);
          sortSongs(state.songs, state.books[setBook].bookNo!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                BooksList(parent: this, books: state.books, songs: state.songs),
                SongsList(
                  parent: this,
                  books: state.books,
                  songs: state.songs,
                  filtered: filtered,
                ),
              ],
            ),
          ),
          /*floatingActionButton: _showBackToTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              child: Icon(Icons.arrow_upward),
            )
          : null,*/
        );
      },
    );
  }
}

List<SongExt> sortSongsByBook(SongExtSort songExtSort) {
  return songExtSort.songs
      .where((s) => s.book == songExtSort.bookNo)
      .take(20)
      .toList();
}
