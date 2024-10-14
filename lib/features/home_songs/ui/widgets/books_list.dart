part of '../songs_screen.dart';

class BooksList extends StatefulWidget {
  final SongsScreenState parent;
  const BooksList({super.key, required this.parent});

  @override
  State<BooksList> createState() => BooksListState();
}

class BooksListState extends State<BooksList> {
  late SongsScreenState parent;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    return SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemCount: parent.books.length,
        itemBuilder: (context, index) {
          final Book book = parent.books[index];
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
