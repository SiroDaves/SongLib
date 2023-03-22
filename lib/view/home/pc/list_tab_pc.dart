part of '../home_screen.dart';

class ListTabPc extends StatelessWidget {
  final HomeVm vm;
  const ListTabPc(this.vm, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    var listContainer = ListView.builder(
      itemCount: vm.listeds!.length,
      padding: EdgeInsets.all(
        size.height * 0.015,
      ),
      itemBuilder: (context, index) {
        final Listed listed = vm.listeds![index];
        return ContextMenuRegion(
          contextMenu: GenericContextMenu(
            buttonConfigs: [
              ContextMenuButtonConfig(
                tr.deleteList,
                icon: const Icon(Icons.delete, size: 20),
                onPressed: () => vm.deleteList(context, listed),
              ),
            ],
          ),
          child: ListedItem(
            listed: listed,
            height: size.height,
            onPressed: () {
              vm.localStorage.listed = vm.setListed = listed;
              vm.fetchSetListedData();
              vm.rebuild();
            },
          ),
        );
      },
    );

    var listViewer = Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(vm.setListed.title!),
        actions: <Widget>[
          InkWell(
            onTap: () {},//=> editListForm(context, vm),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.edit),
            ),
          ),
          InkWell(
            onTap: () {},//=> vm.confirmDelete(context),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.delete),
            ),
          ),
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
        /*child: ListView.builder(
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
        ),*/
      ),
    );
    return ContextMenuOverlay(
      cardBuilder: (_, children) => Container(
        decoration: const BoxDecoration(
          color: ThemeColors.accent,
          boxShadow: [BoxShadow(blurRadius: 5)],
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(children: children),
      ),
      child: vm.isLoading
          ? const ListLoading()
          : vm.listeds!.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    listContainer.expanded(),
                    if (vm.setListed.title!.isNotEmpty) listViewer.expanded(),
                  ],
                )
              : NoDataToShow(
                  title: tr.itsEmptyHere1,
                  description: tr.itsEmptyHereBody4,
                ),
    );
  }
}
