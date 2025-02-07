import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../common/widgets/action/fab_widget.dart';
import '../../../common/widgets/presentor/presentor_animate.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../core/theme/theme_colors.dart';
import '../common/presentor_intents.dart';
import '../common/presentor_utils.dart';
import '../common/slide_utils.dart';

part 'widgets/presentor_view.dart';
part 'widgets/fab_widget.dart';
part 'widgets/presentor_body.dart';
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
  State<PresentorScreen> createState() => PresentorScreenState();
}

class PresentorScreenState extends State<PresentorScreen> {
  late AppLocalizations l10n;
  late String songTitle, songBook;
  bool hasChorus = false, likeChanged = false, slideHorizontal = false;
  List<String> songVerses = [];
  List<Tab> widgetTabs = [];
  List<Widget> widgetContent = [];
  int currentSlide = 0;

  @override
  void initState() {
    super.initState();
    if (widget.song.content.contains("CHORUS")) {
      hasChorus = true;
    }
    l10n = AppLocalizations.of(context)!;
    songTitle = songItemTitle(widget.song.songNo, widget.song.title);
    songBook = refineTitle(widget.song.songbook);
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

  void setSlideByNumber(int slide) {
    setState(() {
      currentSlide = getSlideByNumber(slide, hasChorus, widgetContent.length);
    });
  }

  void setSlideByLetter(String slide) {
    setState(() {
      currentSlide = getSlideByLetter(slide, hasChorus, widgetContent.length);
    });
  }

  void setPreviousSlide() {
    if (currentSlide != 0) {
      setState(() => currentSlide = currentSlide - 1);
    }
  }

  void setNextSlide() {
    if (currentSlide < widgetContent.length) {
      setState(() => currentSlide = currentSlide + 1);
    }
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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;
        if (context.mounted) {
          Navigator.pop(context, likeChanged);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(songTitle),
          actions: [
            Tooltip(
              message: widget.song.liked ? l10n.songLike : l10n.songDislike,
              child: IconButton(
                onPressed: _toggleLike,
                icon: Icon(
                    widget.song.liked ? Icons.favorite : Icons.favorite_border),
              ),
            ),
          ],
        ),
        body: PresentorBody(parent: this),
        floatingActionButton: PresentorFabWidget(song: widget.song),
      ),
    );
  }
}
