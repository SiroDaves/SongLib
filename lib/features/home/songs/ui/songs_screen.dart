import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../common/data/models/models.dart';
import '../../../../common/utils/app_util.dart';
import '../../../../common/widgets/list_items/search_book_item.dart';
import '../../../../common/widgets/list_items/search_song_item.dart';
import '../../../../core/theme/theme_styles.dart';
import '../../../common/app_intents.dart';
import '../../../common/search_songs_utils.dart';
import '../../../presentor/ui/presentor_screen.dart';
import '../../common/bloc/home_bloc.dart';
import '../../common/ui/home_screen.dart';

part 'widgets/song_viewer.dart';
part 'widgets/list_widgets.dart';

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
  late HomeBloc bloc;
  late HomeScreenState parent;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    parent = widget.parent;
    bloc = context.read<HomeBloc>();
  }

  Future<void> onSongSelect(SongExt song, bool shouldOpen) async {
    setState(() => parent.selectedSong = song);
    if (shouldOpen) {
      onSongOpen();
    }
  }

  Future<void> onSongOpen() async {
    SongExt song = parent.selectedSong;
    Book book = parent.books[0];
    try {
      parent.books.firstWhere(
        (b) => b.bookId == song.book,
        orElse: () => parent.books[0],
      );
    } catch (e) {
      logger('Failed to get the book: $e');
    }

    bool? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PresentorScreen(
          song: song,
          book: book,
          songs: parent.songs,
        ),
      ),
    );

    if (result == true) {
      bloc.add(FilterData(book));
    }
  }

  void _onSearch(String query) {
    setState(() {
      parent.filtered = query.isEmpty
          ? parent.songs
          : filterSongsByQuery(query.toLowerCase(), parent.songs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isBigScreen
        ? _buildBigScreen()
        : SingleChildScrollView(
            child: Column(
              children: [
                BooksList(books: parent.books, selectedBook: 0),
                SongsList(
                  selectedSong: parent.selectedSong,
                  songs: parent.filtered,
                  onTap: onSongSelect,
                ),
              ],
            ),
          );
  }

  Widget _buildBigScreen() {
    return LayoutBuilder(builder: (context, dimens) {
      var bigScreenView = Row(
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
                  books: parent.books,
                  selectedBook: parent.selectedBook,
                ),
                SongsList(
                  selectedSong: parent.selectedSong,
                  songs: parent.filtered,
                  onTap: onSongSelect,
                  isBigScreen: true,
                ).expanded(),
              ],
            ),
          ).width(dimens.maxWidth / 2.2),
          SongViewer(
            song: parent.selectedSong,
            books: parent.books,
            songs: parent.songs,
          ).expanded(),
        ],
      );
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        return Shortcuts(
          shortcuts: <ShortcutActivator, Intent>{
            CharacterActivator('s'): SearchIntent(),
            SingleActivator(LogicalKeyboardKey.enter): OpenIntent(),
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              SearchIntent: CallbackAction<SearchIntent>(
                onInvoke: (intent) => {
                  //searchController.
                },
              ),
              OpenIntent: CallbackAction<OpenIntent>(
                onInvoke: (intent) => onSongOpen(),
              ),
            },
            child: Focus(
              autofocus: true,
              onKeyEvent: (node, event) {
                logger('Key pressed: ${event.logicalKey.keyLabel}');
                return KeyEventResult.ignored;
              },
              child: bigScreenView,
            ),
          ),
        );
      } else {
        return bigScreenView;
      }
    });
  }
}
