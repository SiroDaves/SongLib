part of 'step1_screen.dart';

class Step1Details extends StatefulWidget {
  final Step1ScreenState parent;

  const Step1Details({super.key, required this.parent});

  @override
  State<Step1Details> createState() => Step1DetailsState();
}

class Step1DetailsState extends State<Step1Details> {
  late Step1ScreenState parent;

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
    final size = MediaQuery.of(context).size;
    final isTabletOrIpad = size.shortestSide > 550;
    parent = widget.parent;

    var booksGridview = LayoutBuilder(
      builder: (context, dimens) {
        final axisCount = (dimens.maxWidth / 450).round();
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: axisCount,
            childAspectRatio: 4,
          ),
          itemCount: parent.booksListing.length,
          itemBuilder: (context, index) => BookItem(
            item: parent.booksListing[index],
            onPressed: () => onBookSelected(index, parent.booksListing),
          ),
        );
      },
    );
    var booksListview = ListView.builder(
      itemCount: parent.booksListing.length,
      itemBuilder: (context, index) => BookItem(
        item: parent.booksListing[index],
        onPressed: () => onBookSelected(index, parent.booksListing),
      ),
    );
    return isTabletOrIpad ? booksGridview : booksListview;
  }
}
