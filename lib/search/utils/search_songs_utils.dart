import '../ui/search_screen.dart';

/// filter songs based on the selected book
void filterSongsPexrSetBook(
  SearchScreenState parent,
) {
  if (!parent.isLoading || parent.hasMoreData) {
    //setState(() => isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      final nextPageItems = parent.bloc.state.songs
          .where((song) =>
              song.book == parent.bloc.state.books[parent.setBook].bookId)
          .skip(parent.currentPage * parent.pageSize)
          .take(parent.pageSize)
          .toList();
      if (nextPageItems.isEmpty) {
        parent.hasMoreData = false;
      } else {
        parent.filtered.addAll(nextPageItems);
        parent.currentPage++;
      }
      parent.isLoading = false;
    });
  }
}
