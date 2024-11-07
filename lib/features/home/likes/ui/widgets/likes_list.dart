part of '../likes_screen.dart';

class LikesList extends StatefulWidget {
  final LikesScreenState parent;
  const LikesList({super.key, required this.parent});

  @override
  State<LikesList> createState() => LikesListState();
}

class LikesListState extends State<LikesList> {
  late LikesScreenState parent;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    ScrollController scrollController = ScrollController();

    return ListView.builder(
      controller: scrollController,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: Sizes.xs, right: Sizes.m),
      itemCount: parent.likes.length,
      itemBuilder: (context, index) {
        final SongExt like = parent.likes[index];
        return SearchSongItem(
          song: like,
          height: 50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PresentorScreen(song: like),
              ),
            );
          },
        );
      },
    );
  }
}
