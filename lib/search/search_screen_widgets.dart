part of 'search_screen.dart';

class BooksList extends StatefulWidget {
  final SearchScreenState parent;
  final List<Book> books;
  final List<SongExt> songs;
  const BooksList({
    super.key,
    required this.parent,
    required this.books,
    required this.songs,
  });

  @override
  State<BooksList> createState() => BooksListState();
}

class BooksListState extends State<BooksList> {
  late SearchScreenState parent;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    return SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          final Book book = widget.books[index];
          return SearchBookItem(
            text: book.title!,
            isSelected: parent.setBook == index,
            onPressed: () {
              setState(() => parent.setBook = index);
              parent.sortSongs(widget.songs, widget.books[index].bookNo!);
            },
          );
        },
      ),
    );
  }
}

class SongsList extends StatefulWidget {
  final SearchScreenState parent;
  final List<Book> books;
  final List<SongExt> songs;
  final List<SongExt> filtered;
  const SongsList({
    super.key,
    required this.parent,
    required this.books,
    required this.songs,
    required this.filtered,
  });

  @override
  State<SongsList> createState() => SongsListState();
}

class SongsListState extends State<SongsList> {
  late SearchScreenState parent;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.filtered.length,
      itemBuilder: (context, index) {
        final SongExt song = widget.filtered[index];
        return SearchSongItem(
          song: song,
          height: 50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PresentorScreen(
                  song: song,
                  books: widget.books,
                  songs: widget.songs,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
