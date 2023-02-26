part of '../../home_screen.dart';

class SearchTabBs extends StatelessWidget {
  final HomeVm vm;
  const SearchTabBs(this.vm, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var booksContainer = SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) {
          final Book book = vm.books![index];
          return SongBook(
            book: book,
            onTap: () => vm.selectSongbook(book),
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
        left: size.height * 0.0082,
        right: size.height * 0.0082,
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
            height: size.height,
            onTap: () => vm.openPresentor(song: song),
          ),
        );
      },
    );
    var songViewer = Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
          ),
        ),
        elevation: 8,
        title: Text(vm.songTitle),
        actions: <Widget>[
          InkWell(
            onTap: vm.navigator.goToProjector,
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(ThemeAssets.iconProject,
                    height: 35, width: 35)),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.orange,
              ThemeColors.accent,
              ThemeColors.primary,
              Colors.black,
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: vm.verses.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                vm.verses[index].replaceAll("#", "\n"),
                style: TextStyle(fontSize: size.height * 0.03),
              ).padding(all: 10),
            );
          },
        ),
      ),
    );
    return Column(
      children: [
        vm.books!.isNotEmpty ? booksContainer : Container(),
        SizedBox(
          height: size.height - 160,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listContainer.expanded(),
              if (vm.verses.isNotEmpty) songViewer.expanded(),
            ],
          ),
        ),
      ],
    );
  }
}
