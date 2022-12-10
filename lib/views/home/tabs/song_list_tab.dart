part of '../home_screen.dart';

/// Tab screen with list of song lists
// ignore: must_be_immutable
class SongListTab extends StatelessWidget {
  final HomeVm homeVm;
  SongListTab({Key? key, required this.homeVm}) : super(key: key);
  Size? size;

  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  void onRefresh() async {
    await homeVm.fetchListedData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await homeVm.fetchListedData();
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
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => newListForm(context),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget mainContainer(BuildContext context) {
    return SizedBox(
      child: homeVm.isBusy
          ? const ListLoading()
          : Column(
              children: [
                homeVm.listeds!.isNotEmpty
                    ? SongListSearch(
                        viewModel: homeVm,
                        listeds: homeVm.listeds,
                        height: size!.height,
                      )
                    : Container(),
                homeVm.listeds!.isNotEmpty
                    ? listContainer(context)
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
            color: AppColors.primary,
          ),
        ),
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
          itemCount: homeVm.listeds!.length,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0082,
          ),
          itemBuilder: (context, index) {
            final Listed listed = homeVm.listeds![index];
            return ContextMenuRegion(
              contextMenu: GenericContextMenu(
                buttonConfigs: [
                  ContextMenuButtonConfig(
                    AppConstants.deleteList,
                    icon: const Icon(Icons.delete, size: 20),
                    onPressed: () => homeVm.deleteList(context, listed),
                  ),
                ],
              ),
              child: ListedItem(
                listed: listed,
                height: size!.height,
                onTap: () => homeVm.openListView(listed),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> newListForm(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Draft a New List',
          style: TextStyle(
            fontSize: 22,
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FormInput(
                iLabel: 'Title',
                iController: homeVm.titleController!,
                iOptions: const <String>[],
              ),
              FormInput(
                iLabel: 'Description (Optional)',
                iController: homeVm.contentController!,
                iOptions: const <String>[],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              homeVm.saveNewList();
              homeVm.titleController!.clear();
              homeVm.contentController!.clear();
              Navigator.pop(context);
            },
            child: const Text("SAVE LIST"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("CANCEL"),
          ),
        ],
      ),
    );
  }
}
