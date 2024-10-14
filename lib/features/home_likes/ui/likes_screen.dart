import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/data/models/book.dart';
import '../../../core/theme/theme_styles.dart';
import '../../../common/widgets/list_items/search_song_item.dart';
import '../../../common/widgets/progress/skeleton.dart';
import '../../../common/data/models/songext.dart';
import '../../home/bloc/home_bloc.dart';
import '../../home/ui/home_screen.dart';
import '../../presentor/ui/presentor_screen.dart';

part 'widgets/likes_list.dart';

class LikesScreen extends StatefulWidget {
  const LikesScreen({super.key});

  @override
  State<LikesScreen> createState() => LikesScreenState();
}

class LikesScreenState extends State<LikesScreen> {
  late HomeBodyState parent;
  late HomeBloc bloc;

  int setBook = 0, setSong = 0;
  int pageSize = 20, currentPage = 0;
  bool hasMoreData = true;
  List<Book> books = [];
  List<SongExt> likes = [], filtered = [];

  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    bloc = context.read<HomeBloc>();
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

  /// filter likes based on the selected book
  void filterSongsByBook() {
    if (!hasMoreData) return;

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        final nextPageItems = likes
            .where((song) => song.book == books[setBook].bookId)
            .skip(currentPage * pageSize)
            .take(pageSize)
            .toList();
        if (nextPageItems.isEmpty) {
          hasMoreData = false;
        } else {
          filtered.addAll(nextPageItems);
          currentPage++;
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is LoadedState) {
          setState(() {
            setBook = 0;
            filterSongsByBook();
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            controller: _scrollController,
            child: LikesList(parent: this),
          ),
        );
      },
    );
  }
}
