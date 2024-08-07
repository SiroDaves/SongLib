part of '../songs_screen.dart';

class SongsList extends StatefulWidget {
  final SongsScreenState parent;
  const SongsList({super.key, required this.parent});

  @override
  State<SongsList> createState() => SongsListState();
}

class SongsListState extends State<SongsList> {
  late SongsScreenState parent;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    ScrollController scrollController = ScrollController();

    return ListView.builder(
      controller: scrollController,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: Sizes.xs),
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
                child: Text(''),
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
