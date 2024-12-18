import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/data/models/models.dart';
import '../../../../common/widgets/list_items/search_book_item.dart';
import '../../../../common/widgets/list_items/search_song_item.dart';
import '../../../../common/widgets/progress/general_progress.dart';
import '../../../../core/theme/theme_styles.dart';
import '../../../presentor/ui/presentor_screen.dart';
import '../../common/bloc/home_bloc.dart';

class SongsScreen extends StatefulWidget {
  final List<Book> books;
  const SongsScreen({super.key, required this.books});

  @override
  State<SongsScreen> createState() => SongsScreenState();
}

class SongsScreenState extends State<SongsScreen> {
  int setBook = 0;
  late Widget bookList, songList;

  @override
  Widget build(BuildContext context) {
    bookList = SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          final Book book = widget.books[index];
          return SearchBookItem(
            text: book.title!,
            isSelected: setBook == index,
            onPressed: () {
              context.read<HomeBloc>().add(FilterData(book));
            },
          );
        },
      ),
    );
    songList = Padding(
      padding: EdgeInsets.only(top: 20),
      child: EmptyState(
        title:
            'Oops there is a problem displaying songs under the book you selected.\n\n'
            'You can fix the issue by selecting them afresh',
        showRetry: true,
        titleRetry: 'SELECT SONGS AFRESH',
        onRetry: () => context.read<HomeBloc>().add(const ResetData()),
      ),
    );

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeFilteredState && state.songs.isNotEmpty) {
          setBook = widget.books.indexOf(state.book);
          songList = ListView.builder(
            itemCount: state.songs.length,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: Sizes.xs, right: Sizes.sm),
            itemBuilder: (context, index) {
              final SongExt song = state.songs[index];
              return SearchSongItem(
                song: song,
                height: 50,
                onPressed: () async {
                  bool? result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PresentorScreen(
                        song: song,
                        books: widget.books,
                        songs: state.songs,
                      ),
                    ),
                  );

                  if (result == true) {
                    var book = widget.books.firstWhere(
                      (b) => b.bookId == song.book,
                    );
                    context.read<HomeBloc>().add(FilterData(book));
                  }
                },
              );
            },
          );
        }

        return SingleChildScrollView(
          //controller: _scrollController,
          child: Column(
            children: <Widget>[
              bookList,
              songList,
            ],
          ),
        );
      },
    );
  }
}
