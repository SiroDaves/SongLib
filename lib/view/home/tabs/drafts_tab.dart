part of '../home_screen.dart';

/// Tab screen with list of song drafts
// ignore: must_be_immutable
class DraftsTab extends StatelessWidget {
  final HomeVm homeVm;
  DraftsTab({Key? key, required this.homeVm}) : super(key: key);
  Size? size;

  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  void onRefresh() async {
    await homeVm.fetchDraftsData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await homeVm.fetchDraftsData();
    refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    var listContainer = SizedBox(
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
            final Draft draft = homeVm.drafts![index];
            return DraftItem(
              draft: draft,
              height: size!.height,
              onTap: () => homeVm.openPresentor(draft: draft),
            );
          },
          itemCount: homeVm.drafts!.length,
        ),
      ),
    );

    var titleContainer = homeVm.isBusy
        ? PageTitle(label: AppConstants.draftTitle, size: size)
        : homeVm.drafts!.isNotEmpty
            ? PageSearch(
                label: AppConstants.draftTitle,
                size: size,
                onTap: () async {
                  await showSearch(
                    context: context,
                    delegate: SearchDrafts(
                      context,
                      homeVm,
                      size!.height,
                      homeVm.drafts!,
                    ),
                  );
                },
              )
            : PageTitle(label: AppConstants.draftTitle, size: size);

    var mainContainer = SizedBox(
      child: homeVm.isBusy
          ? const ListLoading()
          : homeVm.drafts!.isNotEmpty
              ? listContainer
              : const NoDataToShow(
                  title: AppConstants.itsEmptyHere,
                  description: AppConstants.itsEmptyHereBody2,
                ),
    );

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
              titleContainer,
              mainContainer,
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          backgroundColor: ThemeColors.primary,
          onPressed: () => homeVm.openEditor(),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
