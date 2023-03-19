part of '../home_screen.dart';

/// Tab screen with list of song drafts
// ignore: must_be_immutable
class DraftsTab extends StatelessWidget {
  final HomeVm vm;
  DraftsTab(this.vm, {Key? key}) : super(key: key);
  Size? size;

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context)!;
    size = MediaQuery.of(context).size;

    var listContainer = ListView.builder(
      padding: EdgeInsets.all(
        size!.height * 0.015,
      ),
      itemBuilder: (context, index) {
        final Draft draft = vm.drafts![index];
        return DraftItem(
          draft: draft,
          height: size!.height,
          onTap: () {
            vm.localStorage.draft = vm.setDraft = draft;
            vm.navigator.goToDraftPresentor();
          },
        );
      },
      itemCount: vm.drafts!.length,
    );

    return Scaffold(
      body: Container(
        height: size!.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, ThemeColors.accent, Colors.black],
          ),
        ),
        child: vm.isLoading
            ? const ListLoading()
            : vm.drafts!.isNotEmpty
                ? listContainer
                : NoDataToShow(
                    title: tr.itsEmptyHere,
                    description: tr.itsEmptyHereBody2,
                  ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColors.primary,
        onPressed: () => vm.navigator.goToDraftEditor(true),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
