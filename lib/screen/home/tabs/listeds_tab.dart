part of '../home_screen.dart';

// ignore: must_be_immutable
class ListedsTab extends StatelessWidget {
  final HomeVm viewModel;
  ListedsTab({Key? key, required this.viewModel}) : super(key: key);

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
        onPressed: () => newListForm(context, viewModel),
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
                        homeVm: viewModel,
                        listeds: viewModel.listeds,
                        height: size!.height,
                      )
                    : Container(),
                viewModel.listeds!.isNotEmpty
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
            color: ThemeColors.primary,
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
          itemCount: viewModel.listeds!.length,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0082,
          ),
          itemBuilder: (context, index) {
            final Listed listed = viewModel.listeds![index];
            return ListedItem(
              listed: listed,
              height: size!.height,
              onTap: () => viewModel.openListView(listed),
            );
          },
        ),
      ),
    );
  }

  Future<void> newListForm(BuildContext context, HomeVm viewModel) async {
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
                iController: viewModel.titleController!,
                iOptions: const <String>[],
              ),
              FormInput(
                iLabel: 'Description (Optional)',
                iController: viewModel.contentController!,
                iOptions: const <String>[],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              viewModel.titleController!.clear();
              viewModel.contentController!.clear();
              viewModel.saveNewList();
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
