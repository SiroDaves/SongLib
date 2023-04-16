part of '../home_screen.dart';

/// Tab screen for searches
// ignore: must_be_immutable
class SearchTab extends StatelessWidget {
  final HomeVm vm;
  SearchTab(this.vm, {Key? key}) : super(key: key);
  Size? size;

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context)!;
    size = MediaQuery.of(context).size;
  // creates a horizontal list of books to display
    var booksContainer = SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) {
          final Book book = vm.books![index];
          return SongBook(
            book: book,
            isSelected: vm.setBook == book,
            onPressed: () => vm.selectSongbook(book),
          );
        },
        itemCount: vm.books!.length,
      ),
    );
    var listContainer = ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      // limits number of songs displayed to thirty
      itemCount: vm.filtered!.length,
      padding: EdgeInsets.only(
        left: size!.height * 0.0082,
        right: size!.height * 0.0082,
      ),
      itemBuilder: (context, index) {
        final SongExt song = vm.filtered![index];
        return ContextMenuRegion(
          contextMenu: GenericContextMenu(
            buttonConfigs: [
              // Provides a way to like a song and add it to liked songs tab
              ContextMenuButtonConfig(
                tr.likeSong,
                icon: Icon(
                  song.liked! ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                ),
                onPressed: () => vm.likeSong(song),
              ),
              // Provides a way to copy the song title and number to clipboard
              ContextMenuButtonConfig(
                tr.copySong,
                icon: const Icon(Icons.copy, size: 20),
                onPressed: () => vm.copySong(song),
              ),
              // Displays a context menu to share the song title and number
              ContextMenuButtonConfig(
                tr.shareSong,
                icon: const Icon(Icons.share, size: 20),
                onPressed: () => vm.shareSong(song),
              ),
              // Displays an option to edit the song
              ContextMenuButtonConfig(
                tr.editSong,
                icon: const Icon(Icons.edit, size: 20),
                onPressed: () {
                  vm.localStorage.song = vm.setSong = song;
                  vm.navigator.goToSongEditor();
                },
              ),
              // Diplays a context menu to share, edit and copy a song
              ContextMenuButtonConfig(
                tr.addtoList,
                icon: const Icon(Icons.add, size: 20),
                onPressed: () => showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return ListPopup(vm: vm, song: song);
                  },
                ),
              ),
            ],
          ),
          // displays song item and navigates to song presenter upon pressing
          child: SongItem(
            song: song,
            height: size!.height,
            onPressed: () {
              vm.localStorage.song = vm.setSong = song;
              vm.navigator.goToSongPresentor();
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
          height: size!.height,
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
                vm.books!.isNotEmpty ? booksContainer : const SizedBox.shrink(),
                SizedBox(
                  child: vm.isLoading
                      ? const ListLoading()
                      : vm.songs!.isNotEmpty
                          ? listContainer
                          : NoDataToShow(
                              title: tr.itsEmptyHere,
                              description: tr.itsEmptyHereBody,
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
