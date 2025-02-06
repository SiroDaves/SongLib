import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../common/data/models/models.dart';
import '../../../../common/utils/app_util.dart';
import '../../../../common/utils/constants/app_assets.dart';
import '../../../../common/widgets/list_items/search_book_item.dart';
import '../../../../common/widgets/list_items/search_song_item.dart';
import '../../../../common/widgets/progress/general_progress.dart';
import '../../../../core/theme/theme_styles.dart';
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
  State<SongsScreen> createState() => SongsScreenState();
}

class SongsScreenState extends State<SongsScreen> {
  late HomeBloc bloc;
  final TextEditingController searchController = TextEditingController();

  void onSongSelect(SongExt song, List<SongExt> songs) async {
    Book book = widget.parent.books.firstWhere(
      (b) => b.bookId == song.book,
      orElse: () => widget.parent.books[0],
    );

    if (!widget.isBigScreen) {
      bool? result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              PresentorScreen(song: song, book: book, songs: songs),
        ),
      );

      if (result == true) {
        bloc.add(FilterData(book));
      }
    }
  }

  Widget _buildSongList(List<SongExt> songs) {
    return ListView.separated(
      itemCount: songs.length,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: Sizes.xs),
      padding: const EdgeInsets.only(left: Sizes.xs, right: Sizes.sm),
      itemBuilder: (context, index) {
        final song = songs[index];
        return SearchSongItem(
          song: song,
          height: 50,
          onPressed: () => onSongSelect(song, songs),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bloc = context.read<HomeBloc>();
    var l10n = AppLocalizations.of(context)!;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeFilteredState && state.songs.isNotEmpty) {
          final bookIndex = widget.parent.books.indexOf(state.book);
          final selectedSong = widget.parent.selectedSong = state.songs[0];

          var bigScreenView = [
            Scaffold(
              appBar: AppBar(
                title: SearchWidget(
                  onSearch: (query) {},
                  searchController: searchController,
                ),
              ),
              body: [
                BooksList(books: widget.parent.books, setBook: bookIndex),
                Expanded(child: _buildSongList(state.songs)),
              ].toColumn(),
            ).expanded(),
            SongViewer(
              song: selectedSong,
              books: widget.parent.books,
              songs: state.songs,
            ).expanded(),
          ].toRow();

          var smallScreenView = SingleChildScrollView(
            child: [
              BooksList(books: widget.parent.books, setBook: bookIndex),
              _buildSongList(state.songs),
            ].toColumn(),
          );
          return widget.isBigScreen ? bigScreenView : smallScreenView;
        }

        return EmptyState(
          title: l10n.problemDisplaySongs,
          showRetry: true,
          titleRetry: l10n.selectSongsAfresh,
          onRetry: () => bloc.add(const ResetData()),
        );
      },
    );
  }
}
