part of 'saving_screen.dart';

class SavingScreenBodyDetails extends StatelessWidget {
  const SavingScreenBodyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations? tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    bool isTabletOrIpad = size.shortestSide > 550;

    return BlocBuilder<SavingBloc, SavingState>(
      builder: (context, state) {
        var booksList = isDesktop || isMobile && isTabletOrIpad
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
                    ? const BooksLoading()
                    : state.books.isNotEmpty
                        ? booksList
                        : const SizedBox.shrink(),
                state.status.isFailure
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

class BooksLoading extends StatelessWidget {
  const BooksLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var rowWidget = ListTile(
      onTap: () {},
      leading: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: 20,
          height: 20,
          color: Colors.black,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: Container(
          width: 50,
          height: 20,
          color: Colors.black,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Container(
          width: 50,
          height: 20,
          color: Colors.black,
        ),
      ),
    );

    return SingleChildScrollView(
      child: SkeletonLoader(
        builder: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: rowWidget,
        ),
        items: 10,
        period: const Duration(seconds: 3),
        highlightColor: ThemeColors.primary,
        direction: SkeletonDirection.ltr,
      ),
    );
  }
}
