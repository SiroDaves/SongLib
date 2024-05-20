import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/theme/theme_styles.dart';
import '../../../common/utils/constants/app_constants.dart';
import '../../../common/widgets/list_items/search_book_item.dart';
import '../../../common/widgets/list_items/search_song_item.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../common/widgets/progress/line_progress.dart';
import '../../../data/models/songext.dart';
import '../../../home/bloc/home_bloc.dart';
import '../../../home/ui/home_screen.dart';
import '../../../home/ui/search_songs.dart';

class SearchScreen extends StatefulWidget {
  final HomeScreenState parent;
  const SearchScreen({super.key, required this.parent});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  late HomeBloc _bloc;
  late HomeScreenState parent;
  int setBook = 0, setSong = 0;
  List<Widget> bookItems = <Widget>[
    /*SearchBookItem(
      text: 'Settings',
      icon: Icons.settings,
      onPressed: () {},
    ),*/
  ];

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();
    _bloc.add(const HomeFetchData());
  }

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.status == Status.loaded) {
          setState(() => setBook = 0);
          _bloc.add(HomeSelect(state.books[setBook]));
        }
      },
      builder: (context, state) {
        for (var book in state.books) {
          int index = state.books.indexOf(book);
          bookItems.add(
            SearchBookItem(
              text: book.title!,
              isSelected: setBook == index,
              onPressed: () {
                setState(() => setBook = index);
                _bloc.add(HomeSelect(state.books[setBook]));
              },
            ),
          );
        }
        var booksList = SizedBox(
          height: 40,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(5),
            children: bookItems,
          ),
        );

        var songsList = ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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

        return Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: const Text(AppConstants.appTitle),
            actions: <Widget>[
              InkWell(
                onTap: () async {
                  await showSearch(
                    context: context,
                    delegate: SearchSongs(context, _bloc, size.height),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.search),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.help),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.settings),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (state.status == Status.inProgress) ...[
                  const ListLoading()
                ] else ...[
                  if (state.books.isNotEmpty) ...[booksList],
                  if (state.status == Status.sorted &&
                      state.filtered.isNotEmpty) ...[
                    songsList
                  ] else ...[
                    const EmptyState(title: "It's empty here.")
                  ],
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
