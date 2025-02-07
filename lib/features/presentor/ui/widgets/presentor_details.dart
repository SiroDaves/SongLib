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
    var l10n = AppLocalizations.of(context)!;
    return AppBar(
      title: Text(songTitle),
      actions: [
        Tooltip(
          message: isLiked ? l10n.songLike : l10n.songDislike,
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

class PresentorBody extends StatelessWidget {
  final String bgImage;
  final List<Tab> widgetTabs;
  final List<Widget> widgetContent;
  final bool slideHorizontal;
  final int curSlide;
  final String songBook;

  const PresentorBody({
    super.key,
    required this.bgImage,
    required this.widgetTabs,
    required this.widgetContent,
    required this.slideHorizontal,
    required this.curSlide,
    required this.songBook,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: widgetTabs.isNotEmpty
          ? PresentorView(
              index: curSlide,
              songbook: songBook,
              tabs: widgetTabs,
              contents: widgetContent,
              tabsWidth: size.height * 0.08156,
              indicatorWidth: size.height * 0.08156,
              contentScrollAxis:
                  slideHorizontal ? Axis.horizontal : Axis.vertical,
            )
          : SizedBox(
              height: size.height,
              width: size.width,
            ),
    );
  }
}
