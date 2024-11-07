part of '../presentor_screen.dart';

class PresentorFabWidget extends StatelessWidget {
  final SongExt song;

  const PresentorFabWidget({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      distance: 112.0,
      children: [
        FloatingActionButton(
          heroTag: 'share_fab',
          onPressed: () => shareSong(song),
          backgroundColor: ThemeColors.bgColorPrimary(context),
          child: const Icon(Icons.share, color: Colors.white),
        ),
        FloatingActionButton(
          heroTag: 'copy_fab',
          onPressed: () => copySong(song),
          backgroundColor: ThemeColors.bgColorPrimary(context),
          child: const Icon(Icons.copy, color: Colors.white),
        ),
        FloatingActionButton(
          heroTag: 'edit_fab',
          onPressed: () => {},
          backgroundColor: ThemeColors.bgColorPrimary(context),
          child: const Icon(Icons.edit, color: Colors.white),
        ),
      ],
    );
  }
}
