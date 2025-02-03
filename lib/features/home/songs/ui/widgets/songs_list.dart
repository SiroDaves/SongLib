part of '../songs_screen.dart';

class SongsList extends StatelessWidget {
  final List<Book> books;
  final List<SongExt> songs;
  final int setSong;
  const SongsList({
    super.key,
    required this.books,
    required this.songs,
    this.setSong = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: songs.length,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: Sizes.xs),
      padding: const EdgeInsets.only(left: Sizes.xs, right: Sizes.sm),
      itemBuilder: (context, index) {
        final SongExt song = songs[index];
        return SearchSongItem(
          song: song,
          height: 50,
          onPressed: () async {
            Book book = books[0];
            try {
              book = books.firstWhere(
                (b) => b.bookId == song.book,
              );
            } catch (e) {
              logger('Failed to get the book: $e');
            }

            bool? result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PresentorScreen(
                  song: song,
                  book: book,
                  songs: songs,
                ),
              ),
            );

            if (result == true) {
              context.read<HomeBloc>().add(FilterData(book));
            }
          },
        );
      },
    );
  }
}

class EmptySongsList extends StatelessWidget {
  const EmptySongsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: EmptyState(
        title:
            'Oops there is a problem displaying songs under the book you selected.\n\n'
            'You can fix the issue by selecting them afresh',
        showRetry: true,
        titleRetry: 'SELECT SONGS AFRESH',
        onRetry: () => context.read<HomeBloc>().add(const ResetData()),
      ),
    );
  }
}
