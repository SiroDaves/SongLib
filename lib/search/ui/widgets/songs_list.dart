part of '../search_screen.dart';

class SongsList extends StatefulWidget {
  final SearchScreenState parent;
  const SongsList({super.key, required this.parent});

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
      itemCount: parent.filtered.length + 1,
      itemBuilder: (context, index) {
        if (index == parent.filtered.length) {
          if (parent.hasMoreData) {
            parent.filterSongsByBook();
            return const SkeletonLoading();
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('No more songs'),
              ),
            );
          }
        }
        final SongExt song = parent.filtered[index];
        return SearchSongItem(
          song: song,
          height: 50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PresentorScreen(song: song),
              ),
            );
          },
        );
      },
    );
  }
}
