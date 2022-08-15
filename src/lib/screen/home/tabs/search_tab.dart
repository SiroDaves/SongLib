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
                mainContainer(context, viewModel),
              ],
            ),
          ),
        ),
    );
  }

  Widget mainContainer(BuildContext context, HomeVm viewModel) {
    return SizedBox(
      child: viewModel.isBusy
          ? const ListLoading()
          : Column(
              children: [
                viewModel.searches!.isNotEmpty
                    ? Tab2Search(
                        books: viewModel.books,
                        songs: viewModel.searches,
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
        itemBuilder: (context, index) => SongBook(
          book: viewModel.books![index],
          height: size!.height,
          onTap: () {
            viewModel.mainBook = viewModel.books![index].bookNo!;
            viewModel.fetchSongData();
          },
        ),
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
        controller: viewModel.songScroller,
        child: ListView.builder(
          controller: viewModel.songScroller,
          itemCount: viewModel.songs!.length,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0082,
          ),
          itemBuilder: (context, index) => SongItem(
            song: viewModel.songs![index],
            height: size!.height,
            onTap: () {},
          ),
        ),
      ),
    );
  }

}
