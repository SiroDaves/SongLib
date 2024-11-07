import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injectable.dart';
import '../../../../core/theme/theme_colors.dart';
import '../../../../core/theme/theme_styles.dart';
import '../../../../common/widgets/list_items/search_book_item.dart';
import '../../../../common/widgets/list_items/search_song_item.dart';
import '../../../../common/widgets/progress/skeleton.dart';
import '../../../../common/data/models/book.dart';
import '../../../../common/data/models/songext.dart';
import '../../../presentor/ui/presentor_screen.dart';
import '../bloc/songs_bloc.dart';
import 'songs_search.dart';

part 'widgets/books_list.dart';
part 'widgets/fab_widget.dart';
part 'widgets/songs_list.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({super.key});

  @override
  State<SongsScreen> createState() => SongsScreenState();
}

class SongsScreenState extends State<SongsScreen> {
  late SongsBloc _bloc;

  int setBook = 0, setSong = 0;
  int pageSize = 20, currentPage = 0;
  bool hasMoreData = true;
  List<Book> books = [];
  List<SongExt> songs = [];

  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    _bloc = getIt.get<SongsBloc>();
    _bloc.add(const FetchBooks());
    _scrollController.addListener(() {
      if (_scrollController.offset > 200) {
        if (!_showBackToTopButton) {
          setState(() => _showBackToTopButton = true);
        }
      } else {
        if (_showBackToTopButton) {
          setState(() => _showBackToTopButton = false);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SongsBloc, SongsState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is BooksFetchedState) {
          setState(() {
            setBook = 0;
            books = state.books;
          });
          _bloc.add(FetchSongs(state.books[0].bookId!));
        }
        if (state is SongsFetchedState) {
          setState(() {
            setSong = state.songs[0].songId;
            songs = state.songs;
          });
        }
      },
      builder: (context, state) {
        if (state is ProgressState) {
          return const SkeletonLoading();
        }
        return Scaffold(
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                BooksList(parent: this),
                SongsList(parent: this),
              ],
            ),
          ),
          floatingActionButton: FabWidget(parent: this),
        );
      },
    );
  }
}
