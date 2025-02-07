part of '../presentor_screen.dart';

class PresentorAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String songTitle;
  final bool isLiked;
  final VoidCallback onLikePressed;

  const PresentorAppBar({
    super.key,
    required this.songTitle,
    required this.isLiked,
    required this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(songTitle),
      actions: [
        Tooltip(
          message: isLiked ? "Unlike Song" : "Like Song",
          child: IconButton(
            onPressed: onLikePressed,
            icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
