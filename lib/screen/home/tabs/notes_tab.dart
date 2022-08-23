part of '../home_screen.dart';

// ignore: must_be_immutable
class NotesTab extends StatelessWidget {
  final HomeVm viewModel;
  NotesTab({Key? key, required this.viewModel}) : super(key: key);

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
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget mainContainer(BuildContext context) {
    Widget dataWidget;
    if (viewModel.listeds!.isNotEmpty) {
      dataWidget = Column(
        children: [
          Tab3Search(
            drafts: viewModel.drafts,
            height: size!.height,
          ),
          listContainer(context, viewModel),
        ],
      );
    } else {
      dataWidget = const NoDataToShow(
        title: AppConstants.itsEmptyHere,
        description: AppConstants.itsEmptyHereBody2,
      );
    }

    return SizedBox(
      child: viewModel.isBusy ? const ListLoading() : dataWidget,
    );
  }

  Widget titleContainer() {
    return SizedBox(
      height: size!.height * 0.0815,
      child: Center(
        child: Text(
          AppConstants.draftTitle,
          style: TextStyle(
            fontSize: size!.height * 0.04375,
            fontWeight: FontWeight.bold,
            color: ThemeColors.primary,
          ),
        ),
      ),
    );
  }

  Widget listContainer(BuildContext context, HomeVm viewModel) {
    return SizedBox(
      height: size!.height * 0.78125,
      child: Scrollbar(
        thickness: 10,
        trackVisibility: true,
        thumbVisibility: true,
        radius: const Radius.circular(20),
        child: ListView.builder(
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0163,
          ),
          itemBuilder: (context, index) => GestureDetector(
            child: DraftItem(
                draft: viewModel.drafts![index], height: size!.height),
            onTap: () {},
          ),
          itemCount: viewModel.drafts!.length,
        ),
      ),
    );
  }
}
