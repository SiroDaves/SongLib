import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../common/widgets/action/fab_widget.dart';
import '../../../common/widgets/presentor/presentor_animate.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../common/data/models/songext.dart';
import '../../../core/di/injectable.dart';
import '../../../core/theme/theme_colors.dart';
import '../bloc/presentor_bloc.dart';
import '../common/presentor_utils.dart';

part 'presentor_mobile.dart';
part 'widgets/fab_widget.dart';

class PresentorScreen extends StatefulWidget {
  final SongExt song;
  const PresentorScreen({super.key, required this.song});

  @override
  State<PresentorScreen> createState() => PresentorScreenState();
}

class PresentorScreenState extends State<PresentorScreen> {
  bool isTabletOrIpad = false;
  late SongExt song;

  bool isLiked = false, hasChorus = false, shownPcHints = false;
  bool slideHorizontal = false;
  int curStanza = 0, curSong = 0, curSlide = 0;
  List<String> songVerses = [], verseInfos = [], verseTexts = [];

  String songTitle = '', songBook = '';
  double fSize = 25;
  List<Tab> widgetTabs = [];
  List<Widget> widgetContent = [];

  IconData likeIcon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    var _bloc = getIt<PresentorBloc>();
    var l10n = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;
    song = widget.song;
    songBook = refineTitle(song.songbook);
    songTitle = songItemTitle(song.songNo, song.title);
    var bgImage = Theme.of(context).brightness == Brightness.light
        ? AppAssets.imgBg
        : AppAssets.imgBgBw;

    return BlocProvider(
      create: (context) => _bloc..add(LoadSong(widget.song)),
      child: BlocConsumer<PresentorBloc, PresentorState>(
        listener: (context, state) {
          if (state is FailureState) {
            CustomSnackbar.show(
              context,
              feedbackMessage(state.feedback, l10n),
            );
          }
          if (state is LikedState) {
            if (state.liked) {
              CustomSnackbar.show(
                context,
                'This has been added to your likes',
                isSuccess: true,
              );
            } else {
              CustomSnackbar.show(
                context,
                'This has been removed from your likes',
                isSuccess: true,
              );
            }
          }
        },
        builder: (context, state) {
          if (state is ProgressState) {
            return Scaffold(body: CircularProgress());
          } else if (state is LoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text(songTitle),
                actions: <Widget>[
                  InkWell(
                    onTap: () {
                      _bloc.add(LikeSong(song));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                          song.liked ? Icons.favorite : Icons.favorite_border),
                    ),
                  ),
                  /*InkWell(
                    onTap: () async {
                      await showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return ListViewPopup(song: vm.song!);
                          });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.list),
                    ),
                  ),*/
                ],
              ),
              body: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bgImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: state.widgetTabs!.isNotEmpty
                    ? PresentorMobile(
                        index: curSlide,
                        songbook: songBook,
                        tabs: state.widgetTabs,
                        contents: state.widgetContent,
                        tabsWidth: size.height * 0.08156,
                        indicatorWidth: size.height * 0.08156,
                        contentScrollAxis:
                            slideHorizontal ? Axis.horizontal : Axis.vertical,
                      )
                    : SizedBox(
                        height: size.height,
                        width: size.width,
                      ),
              ),
              floatingActionButton: PresentorFabWidget(song: song),
            );
          }
          return Scaffold(
            body: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bgImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(
                height: size.height,
                width: size.width,
              ),
            ),
          );
        },
      ),
    );
  }
}
