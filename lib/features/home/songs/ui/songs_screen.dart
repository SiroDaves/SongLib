import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../common/data/models/models.dart';
import '../../../../common/utils/app_util.dart';
import '../../../../common/utils/constants/app_assets.dart';
import '../../../../common/widgets/list_items/search_book_item.dart';
import '../../../../common/widgets/list_items/search_song_item.dart';
import '../../../../core/theme/theme_styles.dart';
import '../../../common/search_songs_utils.dart';
import '../../../presentor/ui/presentor_screen.dart';
import '../../common/bloc/home_bloc.dart';
import '../../common/ui/home_screen.dart';

part 'widgets/song_viewer.dart';
part 'widgets/books_list.dart';

class SongsScreen extends StatefulWidget {
  final bool isBigScreen;
  final HomeScreenState parent;

  const SongsScreen({
    super.key,
    required this.parent,
    this.isBigScreen = false,
  });

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  late HomeScreenState parent;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    parent = widget.parent;
  }

  void onSongSelect(SongExt song) {
    setState(() => parent.selectedSong = song);
    if (!widget.isBigScreen) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PresentorScreen(
            song: song,
            book: widget.parent.books.firstWhere(
              (b) => b.bookId == song.book,
              orElse: () => widget.parent.books[0],
            ),
            songs: widget.parent.songs,
          ),
        ),
      );
    }
  }

  void _onSearch(String query) {
    setState(() {
      parent.filtered = query.isEmpty
          ? widget.parent.songs
          : filterSongsByQuery(query.toLowerCase(), widget.parent.songs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isBigScreen
        ? _buildBigScreen()
        : SingleChildScrollView(
            child: Column(
              children: [
                BooksList(books: widget.parent.books, selectedBook: 0),
                SongsList(
                  selectedSong: parent.selectedSong,
                  songs: parent.filtered,
                  onPressed: onSongSelect,
                ),
              ],
            ),
          );
  }

  Widget _buildBigScreen() {
    return LayoutBuilder(builder: (context, dimens) {
      return Row(
        children: [
          Scaffold(
            appBar: AppBar(
              title: SearchWidget(
                searchController: searchController,
                onSearch: _onSearch,
              ),
            ),
            body: Column(
              children: [
                BooksList(
                  books: widget.parent.books,
                  selectedBook: parent.selectedBook,
                ),
                SongsList(
                  selectedSong: parent.selectedSong,
                  songs: parent.filtered,
                  onPressed: onSongSelect,
                ).expanded(),
              ],
            ),
          ).width(dimens.maxWidth / 2.2),
          SongViewer(parent: parent).expanded(),
        ],
      );
    });
  }
}
