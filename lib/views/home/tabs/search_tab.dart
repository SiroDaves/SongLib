part of '../home_screen.dart';

/// Tab screen for searches
// ignore: must_be_immutable
class SearchTab extends StatelessWidget {
  final HomeVm homeVm;
  SearchTab({Key? key, required this.homeVm}) : super(key: key);
  Size? size;

  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  void onRefresh() async {
    await homeVm.fetchSearchData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await homeVm.fetchSearchData();
    refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: ContextMenuOverlay(
        cardBuilder: (_, children) => Container(
          decoration: const BoxDecoration(
            color: AppColors.accent,
            boxShadow: [BoxShadow(blurRadius: 5)],
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(children: children),
        ),
        child: Container(
          height: size!.height,
          padding: const EdgeInsets.only(top: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, AppColors.accent, Colors.black],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                titleContainer(),
                /*SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: const WaterDropHeader(),
                  controller: refreshController,
                  onRefresh: onRefresh,
                  onLoading: onLoading,
                  child: mainContainer(context),
                ),*/
                mainContainer(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context) {
    return SizedBox(
      child: homeVm.isBusy
          ? const ListLoading()
          : Column(
              children: [
                homeVm.songs!.isNotEmpty
                    ? SearchTabSearch(
                        viewModel: homeVm,
                        songs: homeVm.songs,
                        height: size!.height,
                      )
                    : Container(),
                homeVm.books!.isNotEmpty ? bookContainer(context) : Container(),
                homeVm.songs!.isNotEmpty
                    ? listContainer(context)
                    : const NoDataToShow(
                        title: AppConstants.itsEmptyHere,
                        description: AppConstants.itsEmptyHereBody,
                      ),
              ],
            ),
    );
  }

  Widget titleContainer() {
    return SizedBox(
      height: size!.height * 0.0815,
      child: Center(
        child: Text(
          AppConstants.appTitle,
          style: TextStyle(
            fontSize: size!.height * 0.05,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  Widget bookContainer(BuildContext context) {
    return SizedBox(
      height: size!.height * 0.0897,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) {
          final Book book = homeVm.books![index];
          return SongBook(
            book: book,
            height: size!.height,
            onTap: () => homeVm.selectSongbook(book.bookNo!),
          );
        },
        itemCount: homeVm.books!.length,
      ),
    );
  }

  Widget listContainer(BuildContext context) {
    return Container(
      height: size!.height * 0.7,
      padding: const EdgeInsets.only(right: 2),
      child: Scrollbar(
        thickness: 10,
        radius: const Radius.circular(20),
        child: ListView.builder(
          itemCount: homeVm.filtered!.length,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0082,
          ),
          itemBuilder: (context, index) {
            final SongExt song = homeVm.filtered![index];
            return ContextMenuRegion(
              contextMenu: GenericContextMenu(
                buttonConfigs: [
                  ContextMenuButtonConfig(
                    AppConstants.likeSong,
                    icon: Icon(
                      song.liked! ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                    ),
                    onPressed: () => homeVm.likeSong(song),
                  ),
                  ContextMenuButtonConfig(
                    AppConstants.copySong,
                    icon: const Icon(Icons.copy, size: 20),
                    onPressed: () => homeVm.copySong(song),
                  ),
                  ContextMenuButtonConfig(
                    AppConstants.shareSong,
                    icon: const Icon(Icons.share, size: 20),
                    onPressed: () => homeVm.shareSong(song),
                  ),
                  ContextMenuButtonConfig(
                    AppConstants.editSong,
                    icon: const Icon(Icons.edit, size: 20),
                    onPressed: () => homeVm.openEditor(song: song),
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
                onTap: () => homeVm.openPresentor(song: song),
              ),
            );
          },
        ),
      ),
    );
  }
}
