import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/theme/theme_styles.dart';
import '../../../common/widgets/list_items/search_book_item.dart';
import '../../../common/widgets/list_items/search_song_item.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../common/widgets/progress/line_progress.dart';
import '../../../data/models/songext.dart';
import '../../../home/bloc/home_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  late HomeBloc _bloc;
  int setBook = 0, setSong = 0;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();
    _bloc.add(const HomeFetchData());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.status == Status.loaded) {
          setState(() => setBook = 0);
          _bloc.add(HomeSelect(state.books[0]));
        } 
      },
      builder: (context, state) {
        var booksList = SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: state.books.length,
            padding: const EdgeInsets.all(5),
            itemBuilder: (context, index) {
              return SearchBookItem(
                text: state.books[index].title!,
                isSelected: setBook == index,
                onPressed: () {
                  setState(() => setBook = index);
                  _bloc.add(HomeSelect(state.books[index]));
                },
              );
            },
          ),
        );

        var songsList = ListView.builder(
          itemCount: state.filtered.length,
          padding: const EdgeInsets.symmetric(horizontal: Sizes.xs),
          itemBuilder: (context, index) {
            final SongExt song = state.filtered[index];
            return SearchSongItem(
              song: song,
              height: size.height,
            );
          },
        );

        if (state.status == Status.inProgress) {
          return const ListLoading();
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              state.books.isNotEmpty ? booksList : const SizedBox.shrink(),
              Expanded(
                child: state.filtered.isNotEmpty
                    ? songsList
                    : const EmptyState(title: 'its empty here'),
              ),
            ],
          );
        }
      },
    );
  }
}