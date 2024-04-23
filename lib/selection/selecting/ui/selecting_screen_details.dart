part of 'selecting_screen.dart';

class _SelectingBodyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppLocalizations? tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    bool isTabletOrIpad = size.shortestSide > 550;

    return BlocBuilder<SelectingBloc, SelectingState>(
      builder: (context, state) {
        var contentWidget = (isDesktop || isMobile) && isTabletOrIpad
            ? LayoutBuilder(
                builder: (context, dimens) {
                  int axisCount = (dimens.maxWidth / 450).round();
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: axisCount,
                      childAspectRatio: 4,
                    ),
                    itemCount: state.books.length,
                    itemBuilder: (context, index) => BookItem(
                      book: state.books[index],
                      selected: false, //vm.listedBooks[index]!.isSelected,
                      onPressed: () => {}, //vm.onBookSelected(index),
                    ),
                  );
                },
              )
            : ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: state.books.length,
                itemBuilder: (context, index) => BookItem(
                  book: state.books[index],
                  selected: false, //state.listedBooks[index]!.isSelected,
                  onPressed: () => {}, //vm.onBookSelected(index),
                ),
              );

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                state.status.isInProgress
                    ? const CircularProgress()
                    : (state.books.isNotEmpty
                        ? contentWidget
                        : const SizedBox.shrink()),state.status.isFailure
                    ? EmptyState(
                        title: emptyStateMessage(state.feedback, tr),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
