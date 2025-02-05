import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../common/data/models/models.dart';
import '../../../../common/utils/app_util.dart';
import '../../../../common/utils/constants/app_assets.dart';
import '../../../../common/widgets/list_items/search_book_item.dart';
import '../../../../common/widgets/list_items/search_song_item.dart';
import '../../../../common/widgets/progress/general_progress.dart';
import '../../../../core/theme/theme_colors.dart';
import '../../../../core/theme/theme_styles.dart';
import '../../../presentor/ui/presentor_screen.dart';
import '../../common/bloc/home_bloc.dart';

part 'widgets/song_viewer.dart';
part 'widgets/books_list.dart';
part 'widgets/songs_list.dart';

class SongsScreen extends StatefulWidget {
  final bool isBigScreen;
  final List<Book> books;
  const SongsScreen({
    super.key,
    required this.books,
    this.isBigScreen = false,
  });

  @override
  State<SongsScreen> createState() => SongsScreenState();
}

class SongsScreenState extends State<SongsScreen> {
  int setBook = 0, setSong = 0;
  late Widget songListWidget, songViewerWidget;

  @override
  Widget build(BuildContext context) {
    songListWidget = EmptySongsList();
    songViewerWidget = EmptyState(title: 'No song item has been selected');

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeFilteredState && state.songs.isNotEmpty) {
          setBook = widget.books.indexOf(state.book);
          songListWidget = SongsList(
            books: widget.books,
            songs: state.songs,
            setSong: 0,
          );
          var song = state.songs[setSong];
          try {
            songViewerWidget = SongViewer(
              song: song,
              books: widget.books,
              songs: state.songs,
            );
          } catch (e) {
            logger('No song selected: $e');
          }
        }

        if (widget.isBigScreen) {
          return Row(
            children: [
              songListWidget.expanded(),
              songViewerWidget.expanded(),
            ],
          );
        } else {
          return SingleChildScrollView(
            //controller: _scrollController,
            child: Column(
              children: <Widget>[
                BooksList(books: widget.books, setBook: setBook),
                songListWidget,
              ],
            ),
          );
        }
      },
    );
  }
}
