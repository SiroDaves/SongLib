import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/data/models/book.dart';
import '../../../../core/di/injectable.dart';
import '../../../../core/theme/theme_styles.dart';
import '../../../../common/widgets/list_items/search_song_item.dart';
import '../../../../common/data/models/songext.dart';
import '../../../presentor/ui/presentor_screen.dart';
import '../bloc/likes_bloc.dart';

part 'widgets/likes_list.dart';

class LikesScreen extends StatefulWidget {
  const LikesScreen({super.key});

  @override
  State<LikesScreen> createState() => LikesScreenState();
}

class LikesScreenState extends State<LikesScreen> {
  late LikesBloc _bloc;

  int setBook = 0, setSong = 0;
  int pageSize = 20, currentPage = 0;
  bool hasMoreData = true;
  List<Book> books = [];
  List<SongExt> likes = [];

  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<LikesBloc>();
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
    return BlocConsumer<LikesBloc, LikesState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is BooksFetchedState) {
          setState(() {
            setBook = 0;
            books = state.books;
          });
          _bloc.add(FetchLikes(state.books[0].bookId!));
        }
        /*if (state is LikesFetchedState) {
          setState(() {
            setSong = state.likes[0].songId;
            likes = state.likes;
          });
        }*/
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
