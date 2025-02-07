import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../common/widgets/action/fab_widget.dart';
import '../../../common/widgets/presentor/presentor_animate.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../core/theme/theme_colors.dart';
import '../common/presentor_utils.dart';

part 'widgets/presentor_view.dart';
part 'widgets/fab_widget.dart';
part 'widgets/presentor_details.dart';
part 'widgets/presentor_pageview.dart';
part 'widgets/presentor_tabbar.dart';

class PresentorScreen extends StatefulWidget {
  final SongExt song;
  final Book book;
  final List<SongExt> songs;

  const PresentorScreen({
    super.key,
    required this.song,
    required this.book,
    required this.songs,
  });

  @override
  State<PresentorScreen> createState() => _PresentorScreenState();
}

class _PresentorScreenState extends State<PresentorScreen> {
  bool likeChanged = false;
  late AppLocalizations l10n;
  late List<String> songVerses;
  late List<Tab> widgetTabs;
  late List<Widget> widgetContent;
  late String songTitle, songBook;
  bool slideHorizontal = false;
  int curSlide = 0;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() {
    l10n = AppLocalizations.of(context)!;
    songTitle = songItemTitle(widget.song.songNo, widget.song.title);
    songBook = refineTitle(widget.song.songbook);
    songVerses = [];
    widgetTabs = [];
    widgetContent = [];
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      DesktopWindow.setFullScreen(true);
    }
  }

  @override
  void dispose() {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      DesktopWindow.setFullScreen(false);
    }
    super.dispose();
  }

  void _toggleLike() {
    setState(() {
      widget.song.liked = !widget.song.liked;
      likeChanged = true;
    });

    String message = widget.song.liked ? l10n.songLiked : l10n.songDisliked;

    CustomSnackbar.show(context, message, isSuccess: widget.song.liked);
  }

  @override
  Widget build(BuildContext context) {
    String bgImage = Theme.of(context).brightness == Brightness.light
        ? AppAssets.imgBg
        : AppAssets.imgBgBw;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;
        if (context.mounted) {
          Navigator.pop(context, likeChanged);
        }
      },
      child: Scaffold(
        appBar: PresentorAppBar(
          songTitle: songTitle,
          isLiked: widget.song.liked,
          onLikePressed: _toggleLike,
        ),
        body: PresentorBody(
          bgImage: bgImage,
          widgetTabs: widgetTabs,
          widgetContent: widgetContent,
          slideHorizontal: slideHorizontal,
          curSlide: curSlide,
          songBook: songBook,
        ),
        floatingActionButton: PresentorFabWidget(song: widget.song),
      ),
    );
  }
}
