import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../common/data/models/models.dart';
import '../../../../common/utils/app_util.dart';
import '../../../../common/utils/constants/app_assets.dart';
import '../../../../common/widgets/list_items/search_book_item.dart';
import '../../../../common/widgets/list_items/search_song_item.dart';
import '../../../../common/widgets/progress/skeleton.dart';
import '../../../../core/theme/theme_colors.dart';
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
  late final HomeBloc bloc;
  final TextEditingController searchController = TextEditingController();
  List<SongExt> filtered = [];

  @override
  void initState() {
    super.initState();
    bloc = context.read<HomeBloc>();
  }

  void onSongSelect(SongExt song) async {
    Book book = widget.parent.books.firstWhere(
      (b) => b.bookId == song.book,
      orElse: () => widget.parent.books[0],
    );

    if (!widget.isBigScreen) {
      bool? result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PresentorScreen(
            song: song,
            book: book,
            songs: widget.parent.songs,
          ),
        ),
      );

      if (result == true) bloc.add(FilterData(book));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeFilteredState && state.songs.isNotEmpty) {
              return widget.isBigScreen
                  ? _buildBigScreen(state, dimens.maxWidth)
                  : _buildSmallScreen(state);
            }
            return Scaffold(appBar: AppBar(), body: HomeLoading());
          },
        );
      },
    );
  }

  Widget _buildBigScreen(HomeFilteredState state, double maxWidth) {
    filtered = state.songs;
    final selectedSong = filtered[0];
    final bookIndex = widget.parent.books.indexOf(state.book);

    return [
      Scaffold(
        appBar: AppBar(
          title: SearchWidget(
            onSearch: (query) {
              filtered = query.isEmpty
                  ? state.songs
                  : filterSongsByQuery(query.toLowerCase(), widget.parent.songs);
              logger('We found: ${filtered.length}');
            },
            searchController: searchController,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: ThemeColors.foreColorPrimary1(context)),
            ),
          ),
          child: Column(
            children: [
              BooksList(books: widget.parent.books, setBook: bookIndex),
              SongsList(songs: filtered, onPressed: onSongSelect).expanded(),
            ],
          ),
        ),
      ).width(maxWidth / 2.2),
      SongViewer(
        song: selectedSong,
        books: widget.parent.books,
        songs: widget.parent.songs,
      ).expanded(),
    ].toRow();
  }

  Widget _buildSmallScreen(HomeFilteredState state) {
    final bookIndex = widget.parent.books.indexOf(state.book);
    return SingleChildScrollView(
      child: Column(
        children: [
          BooksList(books: widget.parent.books, setBook: bookIndex),
          SongsList(songs: filtered, onPressed: onSongSelect),
        ],
      ),
    );
  }
}
