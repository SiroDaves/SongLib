part of '../home_screen.dart';

/// Tab screen for searches
// ignore: must_be_immutable
class MobileSearchTab extends StatelessWidget {
  MobileSearchTab({super.key});

  late HomeBloc _bloc;

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    _bloc = context.read<HomeBloc>();

    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        var booksContainer = SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(5),
            itemBuilder: (context, index) {
              final Book book = state.books[index];
              return SongBook(
                book: book,
                //isSelected: state.setBook == book,
                onPressed: () => {}, //state.selectSongbook(book),
              );
            },
            itemCount: state.books.length,
          ),
        );
        var listContainer = ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.filtered.length,
          padding: EdgeInsets.only(
            left: size.height * 0.0082,
            right: size.height * 0.0082,
          ),
          itemBuilder: (context, index) {
            final SongExt song = state.filtered[index];
            return ContextMenuRegion(
              contextMenu: GenericContextMenu(
                buttonConfigs: [
                  ContextMenuButtonConfig(
                    tr.likeSong,
                    icon: Icon(
                      song.liked ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                    ),
                    onPressed: () => {}, //state.likeSong(song),
                  ),
                  ContextMenuButtonConfig(
                    tr.copySong,
                    icon: const Icon(Icons.copy, size: 20),
                    onPressed: () => {}, //state.copySong(song),
                  ),
                  ContextMenuButtonConfig(
                    tr.shareSong,
                    icon: const Icon(Icons.share, size: 20),
                    onPressed: () => {}, // state.shareSong(song),
                  ),
                  ContextMenuButtonConfig(
                    tr.editSong,
                    icon: const Icon(Icons.edit, size: 20),
                    onPressed: () {
                      //state.localStorage.song = state.setSong = song;
                      //state.navigator.goToSongEditor();
                    },
                  ),
                  ContextMenuButtonConfig(
                    tr.addtoList,
                    icon: const Icon(Icons.add, size: 20),
                    onPressed: () => showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return const SizedBox(); //ListPopup(_bloc: _bloc, song: song);
                      },
                    ),
                  ),
                ],
              ),
              child: SongItem(
                song: song,
                height: size.height,
                onPressed: () {
                  //state.localStorage.song = state.setSong = song;
                  //state.navigator.goToSongPresentor();
                },
              ),
            );
          },
        );

        return Scaffold(
          body: ContextMenuOverlay(
            cardBuilder: (_, children) => Container(
              decoration: const BoxDecoration(
                color: ThemeColors.accent,
                boxShadow: [BoxShadow(blurRadius: 5)],
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Column(children: children),
            ),
            child: Container(
              height: size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, ThemeColors.accent, Colors.black],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    state.books.isNotEmpty
                        ? booksContainer
                        : const SizedBox.shrink(),
                    SizedBox(
                      child: state.status == Status.inProgress
                          ? const ListLoading()
                          : state.songs.isNotEmpty
                              ? listContainer
                              : EmptyState(
                                  title: tr.itsEmptyHere,
                                  //description: tr.itsEmptyHereBody,
                                ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
