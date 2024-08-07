part of '../songs_screen.dart';

class BooksList extends StatefulWidget {
  final SongsScreenState parent;
  const BooksList({super.key, required this.parent});

  @override
  State<BooksList> createState() => BooksListState();
}

class BooksListState extends State<BooksList> {
  late SongsScreenState parent;
  late HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();
  }

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    return SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemCount: _bloc.state.books.length,
        itemBuilder: (context, index) {
          final Book book = _bloc.state.books[index];
          return SearchBookItem(
            text: book.title!,
            isSelected: parent.setBook == index,
            onPressed: () {
              setState(() {
                parent.setBook = index;
                parent.currentPage = 0;
                parent.filtered.clear();
                parent.filterSongsByBook();
              });
            },
          );
        },
      ),
    );
  }
}
