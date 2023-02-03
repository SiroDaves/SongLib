part of '../home_screen.dart';

/// Tab screen for searches
// ignore: must_be_immutable
class SearchTab extends StatelessWidget {
  final HomeVm vm;
  SearchTab(this.vm, {Key? key}) : super(key: key);
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    var booksContainer = SizedBox(
      height: 120,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) {
          final Book book = vm.books![index];
          return SongBook(
            book: book,
            onTap: () => vm.selectSongbook(book.bookNo!),
          );
        },
        itemCount: vm.books!.length,
      ),
    );
    var listContainer = ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
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
              ContextMenuButtonConfig(
                AppConstants.likeSong,
                icon: Icon(
                  song.liked! ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                ),
                onPressed: () => vm.likeSong(song),
              ),
              ContextMenuButtonConfig(
                AppConstants.copySong,
                icon: const Icon(Icons.copy, size: 20),
                onPressed: () => vm.copySong(song),
              ),
              ContextMenuButtonConfig(
                AppConstants.shareSong,
                icon: const Icon(Icons.share, size: 20),
                onPressed: () => vm.shareSong(song),
              ),
              ContextMenuButtonConfig(
                AppConstants.editSong,
                icon: const Icon(Icons.edit, size: 20),
                onPressed: () => vm.openEditor(song: song),
              ),
              ContextMenuButtonConfig(
                AppConstants.addtoList,
                icon: const Icon(Icons.add, size: 20),
                onPressed: () => showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return ListViewPopup(song: song);
                  },
                ),
              ),
            ],
          ),
          child: SongItem(
            song: song,
            height: size!.height,
            onTap: () => vm.openPresentor(song: song),
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
                vm.books!.isNotEmpty ? booksContainer : Container(),
                SizedBox(
                  child: vm.isLoading
                      ? const ListLoading()
                      : vm.songs!.isNotEmpty
                          ? listContainer
                          : const NoDataToShow(
                              title: AppConstants.itsEmptyHere,
                              description: AppConstants.itsEmptyHereBody,
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
