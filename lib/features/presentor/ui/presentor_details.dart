part of 'presentor_screen.dart';

class PresentorDetails extends StatefulWidget {
  final PresentorScreenState parent;
  const PresentorDetails({super.key, required this.parent});

  @override
  State<PresentorDetails> createState() => PresentorDetailsState();
}

class PresentorDetailsState extends State<PresentorDetails> {
  late PresentorScreenState parent;

  bool isTabletOrIpad = false;
  late AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    l10n = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;
    var bgImage = Theme.of(context).brightness == Brightness.light
        ? AppAssets.imgBg
        : AppAssets.imgBgBw;

    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: parent.widgetTabs.isNotEmpty
          ? PresentorMobile(
              index: parent.curSlide,
              songbook: parent.songBook,
              tabs: parent.widgetTabs,
              contents: parent.widgetContent,
              tabsWidth: size.height * 0.08156,
              indicatorWidth: size.height * 0.08156,
              contentScrollAxis:
                  parent.slideHorizontal ? Axis.horizontal : Axis.vertical,
            )
          : const SizedBox.shrink(),
    );
  }
}
