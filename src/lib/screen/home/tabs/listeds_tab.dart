part of '../home_screen.dart';

// ignore: must_be_immutable
class ListedsTab extends StatelessWidget {
  final HomeVm viewModel;
  ListedsTab({Key? key, required this.viewModel}) : super(key: key);

  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: size!.height,
        padding: const EdgeInsets.only(top: 40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColors.primary,
        onPressed: () => viewModel.newListForm(context),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
  Widget mainContainer(BuildContext context) {
    return SizedBox(
      child: viewModel.isBusy
          ? const ListLoading()
          : Column(
              children: [
                viewModel.listeds!.isNotEmpty
                    ? Tab1Search(
                        listeds: viewModel.listeds,
                        height: size!.height,
                      )
                    : Container(),
                viewModel.likes!.isNotEmpty
                    ? likesContainer(context, viewModel)
                    : Container(),
                viewModel.listeds!.isNotEmpty
                    ? listContainer(context, viewModel)
                    : const NoDataToShow(
                        title: AppConstants.itsEmptyHere1,
                        description: AppConstants.itsEmptyHereBody4,
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
          AppConstants.listTitle,
          style: TextStyle(
            fontSize: size!.height * 0.05,
            fontWeight: FontWeight.bold,
            color: ThemeColors.primary,
          ),
        ),
      ),
    );
  }

  Widget likesContainer(BuildContext context, HomeVm viewModel) {
    return SizedBox(
      height: size!.height * 0.125,
      child: Column(
        children: [
          SizedBox(
            height: size!.height * 0.03125,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'SONG LIKES',
                    style: TextStyle(
                      color: ThemeColors.primary,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child:
                        Icon(Icons.arrow_forward, color: ThemeColors.primary),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size!.height * 0.0897,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(5),
              itemBuilder: (context, index) => SongGrid(
                song: viewModel.likes![index],
                books: viewModel.books!,
                height: size!.height,
                onTap: () {},
              ),
              itemCount: viewModel.likes!.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget listContainer(BuildContext context, HomeVm viewModel) {
    return Container(
      height: size!.height * 0.7,
      padding: const EdgeInsets.only(right: 2),
      child: Scrollbar(
        thickness: 10,
        radius: const Radius.circular(20),
        //controller: viewModel.listsScroller,
        child: ListView.builder(
          //controller: viewModel.listsScroller,
          itemCount: viewModel.listeds!.length,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0082,
          ),
          itemBuilder: (context, index) => ListedItem(
            listed: viewModel.listeds![index],
            height: size!.height,
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
