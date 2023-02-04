part of '../../home_screen.dart';

/// Tab screen with list of song lists
// ignore: must_be_immutable
class ListTab extends StatelessWidget {
  final HomeVm vm;
  ListTab(this.vm, {Key? key}) : super(key: key);
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    var listContainer = ListView.builder(
      itemCount: vm.listeds!.length,
      padding: EdgeInsets.all(
        size!.height * 0.015,
      ),
      itemBuilder: (context, index) {
        final Listed listed = vm.listeds![index];
        return ContextMenuRegion(
          contextMenu: GenericContextMenu(
            buttonConfigs: [
              ContextMenuButtonConfig(
                AppConstants.deleteList,
                icon: const Icon(Icons.delete, size: 20),
                onPressed: () => vm.deleteList(context, listed),
              ),
            ],
          ),
          child: ListedItem(
            listed: listed,
            height: size!.height,
            onTap: () => vm.openListView(listed),
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
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, ThemeColors.accent, Colors.black],
            ),
          ),
          child: vm.isLoading
              ? const ListLoading()
              : vm.listeds!.isNotEmpty
                  ? listContainer
                  : const NoDataToShow(
                      title: AppConstants.itsEmptyHere1,
                      description: AppConstants.itsEmptyHereBody4,
                    ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColors.primary,
        onPressed: () => newListForm(context),
        child: const Icon(Icons.add, color: Colors.white),
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
                iController: vm.titleController!,
                iOptions: const <String>[],
              ),
              FormInput(
                iLabel: 'Description (Optional)',
                iController: vm.contentController!,
                iOptions: const <String>[],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              vm.saveNewList();
              vm.titleController!.clear();
              vm.contentController!.clear();
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
