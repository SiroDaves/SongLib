import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../common/theme/theme_styles.dart';
import '../../common/widgets/list_items/search_book_item.dart';
import '../../common/widgets/list_items/search_song_item.dart';
import '../../common/widgets/progress/general_progress.dart';
import '../../common/widgets/progress/line_progress.dart';
import '../../data/models/book.dart';
import '../../data/models/songext.dart';
import '../../home/bloc/home_bloc.dart';
import '../../home/ui/home_screen.dart';
import '../../presentor/ui/presentor_screen.dart';

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
  static const _pageSize = 20;

  final PagingController<int, SongExt> _pagingController =
      PagingController(firstPageKey: 0);

  /*SearchBookItem(text: 'Settings', icon: Icons.settings, onPressed: () {},),*/

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    //_bloc.add(const HomeFetchData());
  }

  void sortSongs(List<SongExt> songs, int bookNo) async {
    var tempList = await compute(
      sortSongsByBook,
      SongExtSort(bookNo, songs),
    );
    setState(() => filtered = tempList);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final nextPage = pageKey + 1;
      final startIndex = pageKey * _pageSize;
      final endIndex = startIndex + _pageSize;

      final List<SongExt> songsForPage = filtered.sublist(startIndex, endIndex);

      final isLastPage = endIndex >= filtered.length;

      if (isLastPage) {
        _pagingController.appendLastPage(songsForPage);
      } else {
        _pagingController.appendPage(songsForPage, nextPage);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<HomeBloc, HomeState>(
      bloc: parent.bloc,
      listener: (context, state) {
        if (state.status == Status.loaded) {
          setState(() => setBook = 0);
          sortSongs(state.songs, state.books[setBook].bookNo!);
        }
      },
      builder: (context, state) {
        var booksList = SizedBox(
          height: 40,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(5),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              final Book book = state.books[index];
              return SearchBookItem(
                text: book.title!,
                isSelected: setBook == index,
                onPressed: () {
                  setState(() => setBook = index);
                  sortSongs(state.songs, state.books[setBook].bookNo!);
                },
              );
            },
          ),
        );

        var songsList = RefreshIndicator(
          onRefresh: () => Future.sync(
            () => _pagingController.refresh(),
          ),
          child: Expanded(
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.xs),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final SongExt song = filtered[index];
                return SearchSongItem(
                  song: song,
                  height: size.height,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PresentorScreen(
                          song: song,
                          books: state.books,
                          songs: state.songs,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );

        return Scaffold(
          backgroundColor: Colors.grey,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (state.status == Status.inProgress) ...[
                  const ListLoading()
                ] else ...[
                  if (state.books.isNotEmpty) ...[booksList],
                  if (state.songs.isNotEmpty) ...[
                    songsList
                  ] else ...[
                    const EmptyState(title: "It's empty here.")
                  ],
                ]
              ],
            ),
          ),
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
