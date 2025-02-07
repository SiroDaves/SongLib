part of '../presentor_screen.dart';

class PresentorBody extends StatefulWidget {
  final PresentorScreenState parent;

  const PresentorBody({super.key, required this.parent});

  @override
  State<PresentorBody> createState() => PresentorBodyState();
}

class PresentorBodyState extends State<PresentorBody> {
  late AppLocalizations l10n;
  late PresentorScreenState parent;
  late SongExt song;
  bool hasChorus = false, likeChanged = false, slideHorizontal = false;

  @override
  void initState() {
    super.initState();
    parent = widget.parent;
    song = widget.parent.song;
  }

  void _toggleLike() {
    setState(() {
      song.liked = !song.liked;
      parent.likeChanged = true;
    });

    String message = song.liked ? l10n.songLiked : l10n.songDisliked;
    CustomSnackbar.show(context, message, isSuccess: song.liked);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    l10n = AppLocalizations.of(context)!;
    String bgImage = Theme.of(context).brightness == Brightness.light
        ? AppAssets.imgBg
        : AppAssets.imgBgBw;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) {
          return;
        }
        if (context.mounted) {
          Navigator.pop(context, parent.likeChanged);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(parent.songTitle),
          actions: [
            Tooltip(
              message: song.liked ? l10n.songDislike : l10n.songLike,
              child: IconButton(
                onPressed: _toggleLike,
                icon: Icon(song.liked ? Icons.favorite : Icons.favorite_border),
              ),
            ),
          ],
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
            ),
          ),
          child: PresentorDetails(
            parent: parent,
            isBigScreen: size.shortestSide > 550,
          ),
        ),
        floatingActionButton: size.shortestSide > 550
            ? const SizedBox.shrink()
            : PresentorFabWidget(song: song),
      ),
    );
  }
}
