part of '../songs_screen.dart';

class BooksList extends StatelessWidget {
  final List<Book> books;
  final int setBook;
  const BooksList({super.key, required this.books, this.setBook = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemCount: books.length,
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemBuilder: (context, index) {
          final Book book = books[index];
          return SearchBookItem(
            text: book.title!,
            isSelected: setBook == index,
            onPressed: () {
              context.read<HomeBloc>().add(FilterData(book));
            },
          );
        },
      ),
    );
  }
}
