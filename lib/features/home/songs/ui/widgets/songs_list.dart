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
      padding: const EdgeInsets.only(left: Sizes.xs, right: Sizes.m),
      itemCount: parent.songs.length,
      itemBuilder: (context, index) {
        final SongExt song = parent.songs[index];
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
