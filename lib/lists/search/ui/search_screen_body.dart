part of 'search_screen.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({super.key});

  @override
  State<SearchScreenBody> createState() => SearchScreenBodyState();
}

class SearchScreenBodyState extends State<SearchScreenBody> {
  late SearchBloc _bloc;
  int setBook = 0, setSong = 0;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<SearchBloc>();
    _bloc.add(const SearchFetchData());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<SearchBloc, SearchState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.status == Status.loaded) {
          setState(() => setBook = 0);
          _bloc.add(SearchSelect(state.books[0]));
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
                  _bloc.add(SearchSelect(state.books[index]));
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

/*state.status == Status.inProgress
            ? const ListLoading()
            : */
