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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditorScreen(homeVm: viewModel);
              },
            ),
          );
        },
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
                viewModel.drafts!.isNotEmpty
                    ? Tab3Search(
                        drafts: viewModel.drafts,
                        height: size!.height,
                      )
                    : Container(),
                viewModel.drafts!.isNotEmpty
                    ? listContainer(context)
                    : const NoDataToShow(
                        title: AppConstants.itsEmptyHere,
                        description: AppConstants.itsEmptyHereBody2,
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

  Widget listContainer(BuildContext context) {
    return SizedBox(
      height: size!.height * 0.78125,
      child: Scrollbar(
        thickness: 10,
        radius: const Radius.circular(20),
        child: ListView.builder(
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0163,
          ),
          itemBuilder: (context, index) {
            final Draft draft = viewModel.drafts![index];
            return GestureDetector(
              child: DraftItem(
                draft: draft,
                height: size!.height,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      //return EditorScreen(homeVm: viewModel, draft: draft);
                      return PresentorScreen(homeVm: viewModel, draft: draft);
                    },
                  ),
                );
              },
            );
          },
          itemCount: viewModel.drafts!.length,
        ),
      ),
    );
  }
}
