import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../common/data/models/models.dart';
import '../../../common/repository/pref_repository.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../common/utils/constants/pref_constants.dart';
import '../../../common/widgets/action/fab_widget.dart';
import '../../../common/widgets/presentor/presentor_animate.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../core/di/injectable.dart';
import '../../../core/theme/theme_colors.dart';
import '../bloc/presentor_bloc.dart';
import '../common/presentor_intents.dart';
import '../common/presentor_utils.dart';
import '../common/slide_utils.dart';

part 'widgets/presentor_view.dart';
part 'widgets/fab_widget.dart';
part 'widgets/presentor_body.dart';
part 'widgets/presentor_details.dart';
part 'widgets/presentor_widget.dart';

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
  late PrefRepository _prefrepo;
  late SongExt song;
  late String songTitle, songBook;
  bool hasChorus = false, likeChanged = false, slideVertically = true;
  List<String> songVerses = [];
  List<Tab> widgetTabs = [];
  List<Widget> widgetContent = [];
  int currentSlide = 0;

  @override
  void initState() {
    super.initState();
    _prefrepo = getIt<PrefRepository>();
    song = widget.song;
    if (song.content.contains("CHORUS")) {
      hasChorus = true;
    }
    slideVertically = _prefrepo.getPrefBool(PrefConstants.slideVerticallyKey);
    songTitle = songItemTitle(song.songNo, widget.song.title);
    songBook = refineTitle(song.songbook);
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      //DesktopWindow.setFullScreen(true);
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

  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => PresentorBloc()..add(LoadSong(widget.song)),
      child: BlocConsumer<PresentorBloc, PresentorState>(
        listener: (context, state) {
          if (state is PresentorFailureState) {
            CustomSnackbar.show(
              context,
              feedbackMessage(state.feedback, l10n),
            );
          } else if (state is PresentorLikedState) {
            setState(() {
              song.liked = !song.liked;
              likeChanged = true;
            });
            if (state.liked) {
              CustomSnackbar.show(context, l10n.songLiked, isSuccess: true);
            } else {
              CustomSnackbar.show(context, l10n.songDisliked);
            }
          } else if (state is PresentorLoadedState) {
            setState(() {
              songVerses = state.songVerses!;
              widgetTabs = state.widgetTabs!;
              widgetContent = state.widgetContent!;
            });
          }
        },
        builder: (context, state) {
          return state.maybeWhen(
            progress: () => Scaffold(body: CircularProgress()),
            orElse: () => PresentorBody(parent: this),
          );
        },
      ),
    );
  }
}
