import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../common/widgets/action/fab_widget.dart';
import '../../../common/widgets/presentor/presentor_animate.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../core/theme/theme_colors.dart';
import '../bloc/presentor_bloc.dart';
import '../common/presentor_utils.dart';

part 'presentor_mobile.dart';
part 'widgets/fab_widget.dart';

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
  bool isTabletOrIpad = false;
  late Book book;
  late SongExt song;

  bool isLiked = false, hasChorus = false, shownPcHints = false;
  bool slideHorizontal = false, likeChanged = false;
  int curStanza = 0, curSong = 0, curSlide = 0;
  List<String> songVerses = [], verseInfos = [], verseTexts = [];

  String songTitle = '', songBook = '';
  double fSize = 25;
  List<Tab> widgetTabs = [];
  List<Widget> widgetContent = [];

  IconData likeIcon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
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
              CustomSnackbar.show(
                context,
                '${song.title} added to your likes',
                isSuccess: true,
              );
            } else {
              CustomSnackbar.show(
                context,
                '${song.title} removed from your likes',
              );
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
            orElse: () => PopScope(
              canPop: false,
              onPopInvokedWithResult: (bool didPop, dynamic result) async {
                if (didPop) {
                  return;
                }
                if (context.mounted) {
                  Navigator.pop(context, likeChanged);
                }
              },
              child: Scaffold(
                appBar: AppBar(
                  title: Text(songTitle),
                  actions: <Widget>[
                    InkWell(
                      onTap: () {
                        context.read<PresentorBloc>().add(LikeSong(song));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(song.liked
                            ? Icons.favorite
                            : Icons.favorite_border),
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
                  child: widgetTabs.isNotEmpty
                      ? PresentorMobile(
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
                ),
                floatingActionButton: PresentorFabWidget(song: song),
              ),
            ),
          );
        },
      ),
    );
  }
}
