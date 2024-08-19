part of 'selecting_screen.dart';

class SelectingDetails extends StatefulWidget {
  final SelectingBodyState parent;

  const SelectingDetails({super.key, required this.parent});

  @override
  State<SelectingDetails> createState() =>
      SelectingDetailsState();
}

class SelectingDetailsState
    extends State<SelectingDetails> {
  
  void onBookSelected(int index, List<Selectable<Book>> listing) {
    try {
      setState(() {
        final book = listing[index];
        book.isSelected = !book.isSelected;

        if (book.isSelected) {
          widget.parent.booksSelected.add(book.data);
        } else {
          widget.parent.booksSelected.remove(book.data);
        }
      });
    } catch (e) {
      logger('Unable to update selection: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final isTabletOrIpad = size.shortestSide > 550;

    return BlocBuilder<SelectingBloc, SelectingState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.xs),
            child: Stack(
              children: [
                _buildBookList(state, isTabletOrIpad),
                if (state.status == Status.failure)
                  EmptyState(
                    title: emptyStateMessage(state.feedback, l10n),
                    showRetry: true,
                    onRetry: () =>
                        context.read<SelectingBloc>().add(const SelectingBooksFetch()),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBookList(SelectingState state, bool isTabletOrIpad) {
    if (state.status == Status.inProgress) {
      return const SkeletonLoading();
    }

    if (state.status == Status.booksFetched && state.booksListing.isNotEmpty) {
      return isTabletOrIpad ? _buildGrid(state) : _buildList(state);
    }

    return const SizedBox.shrink();
  }

  Widget _buildGrid(SelectingState state) {
    return LayoutBuilder(
      builder: (context, dimens) {
        final axisCount = (dimens.maxWidth / 450).round();
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: axisCount,
            childAspectRatio: 4,
          ),
          itemCount: state.booksListing.length,
          itemBuilder: (context, index) => BookItem(
            item: state.booksListing[index],
            onPressed: () => onBookSelected(index, state.booksListing),
          ),
        );
      },
    );
  }

  Widget _buildList(SelectingState state) {
    return ListView.builder(
      itemCount: state.booksListing.length,
      itemBuilder: (context, index) => BookItem(
        item: state.booksListing[index],
        onPressed: () => onBookSelected(index, state.booksListing),
      ),
    );
  }
}
