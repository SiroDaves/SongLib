part of '../home_screen.dart';

/// Tab screen with list of song lists
// ignore: must_be_immutable
class SongListTab extends StatelessWidget {
  final HomeVm homeVm;
  SongListTab({Key? key, required this.homeVm}) : super(key: key);
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    var titleContainer = homeVm.isBusy
        ? PageTitle(label: AppConstants.listTitle, size: size)
        : homeVm.books!.isNotEmpty
            ? PageSearch(
                label: AppConstants.listTitle,
                size: size,
                onTap: () async {
                  await showSearch(
                    context: context,
                    delegate: SearchList(
                      context,
                      homeVm,
                      size!.height,
                      homeVm.listeds!,
                    ),
                  );
                },
              )
            : PageTitle(label: AppConstants.listTitle, size: size);
    var listContainer = Container(
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

    var mainContainer = SizedBox(
      child: homeVm.isBusy
          ? const ListLoading()
          : homeVm.listeds!.isNotEmpty
              ? listContainer
              : const NoDataToShow(
                  title: AppConstants.itsEmptyHere1,
                  description: AppConstants.itsEmptyHereBody4,
                ),
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
                titleContainer,
                mainContainer,
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          backgroundColor: ThemeColors.primary,
          onPressed: () => newListForm(context),
          child: const Icon(Icons.add, color: Colors.white),
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
            color: ThemeColors.primaryDark,
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
