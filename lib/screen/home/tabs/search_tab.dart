part of '../home_screen.dart';

// ignore: must_be_immutable
class SearchTab extends StatelessWidget {
  final HomeVm viewModel;
  SearchTab({Key? key, required this.viewModel}) : super(key: key);

  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size!.height,
        padding: const EdgeInsets.only(top: 40),
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
              titleContainer(),
              mainContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context) {
    return SizedBox(
      child: viewModel.isBusy
          ? const ListLoading()
          : Column(
              children: [
                viewModel.songs!.isNotEmpty
                    ? Tab2Search(
                        songs: viewModel.songs,
                        height: size!.height,
                      )
                    : Container(),
                viewModel.books!.isNotEmpty
                    ? bookContainer(context)
                    : Container(),
                viewModel.songs!.isNotEmpty
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
            color: ThemeColors.primary,
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
          final Book book = viewModel.books![index];
          return SongBook(
            book: book,
            height: size!.height,
            onTap: () => viewModel.selectSongbook(book.bookNo!),
          );
        },
        itemCount: viewModel.books!.length,
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
          itemCount: viewModel.songs!.length,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0082,
          ),
          itemBuilder: (context, index) {
            final SongExt song = viewModel.songs![index];
            return SongItem(
              song: song,
              height: size!.height,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PresentorScreen(song: song);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
