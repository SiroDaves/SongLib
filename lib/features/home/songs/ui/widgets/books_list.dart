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

class SongsList extends StatelessWidget {
  final List<SongExt> songs;
  final void Function(SongExt) onPressed;
  const SongsList({
    super.key,
    required this.songs,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: songs.length,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: Sizes.xs),
      padding: const EdgeInsets.only(left: Sizes.xs, right: Sizes.sm),
      itemBuilder: (context, index) {
        final song = songs[index];
        return SearchSongItem(
          song: song,
          height: 50,
          onPressed: () => onPressed(song),
        );
      },
    );
  }
}
