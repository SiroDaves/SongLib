part of 'presentor_screen.dart';

class PresentorScreenBody extends StatefulWidget {
  final PresentorScreenState parent;
  final SongExt song;
  const PresentorScreenBody(
      {super.key, required this.parent, required this.song});

  @override
  State<PresentorScreenBody> createState() => PresentorScreenBodyState();
}

class PresentorScreenBodyState extends State<PresentorScreenBody> {
  late AppLocalizations l10n;
  late PresentorBloc _bloc;
  late PresentorScreenState parent;

  bool updateFound = false;
  bool isTabletOrIpad = false;
  bool isLiked = false, hasChorus = false, shownPcHints = false;
  bool slideHorizontal = false;
  int curStanza = 0, curSong = 0, curSlide = 0;
  List<String> songVerses = [], verseInfos = [], verseTexts = [];

  Size? size;
  double fSize = 25;
  List<Tab> widgetTabs = [];
  List<Widget> widgetContent = [];
  IconData likeIcon = Icons.favorite_border;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<PresentorBloc>();
    _bloc.add(PresentorSaveHistory(widget.song));
    _bloc.add(PresentorLoadSong(widget.song));
  }

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    l10n = AppLocalizations.of(context);
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    return BlocConsumer<PresentorBloc, PresentorState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.status == Status.failure) {
          CustomSnackbar.show(
            context,
            feedbackMessage(state.feedback, l10n),
          );
        }
        if (state.status == Status.liked || state.status == Status.unliked) {
          CustomSnackbar.show(
            context,
            state.status == Status.liked
                ? '${widget.song.title} liked'
                : '${widget.song.title} removed from likes',
          );
        }
      },
      builder: (context, state) {
        var bgImage = Theme.of(context).brightness == Brightness.light
            ? AppAssets.imgBg
            : AppAssets.imgBgBw;
        return Scaffold(
          appBar: AppBar(
            title: Text(state.songTitle),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  _bloc.add(PresentorLikeSong(widget.song));
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.favorite),
                ),
              ),
              const PresentorMenu(),
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
            child: state.status == Status.inProgress
                ? const CircularProgress()
                : state.widgetTabs.isNotEmpty
                    ? PresentorMobile(
                        index: curSlide,
                        songbook: state.songBook,
                        tabs: state.widgetTabs,
                        contents: state.widgetContent,
                        tabsWidth: size.height * 0.08156,
                        indicatorWidth: size.height * 0.08156,
                        contentScrollAxis:
                            slideHorizontal ? Axis.horizontal : Axis.vertical,
                      )
                    : const SizedBox.shrink(),
          ),
          floatingActionButton: ExpandableFab(
            distance: 112.0,
            children: [
              FloatingActionButton(
                heroTag: 'share_fab',
                onPressed: () => shareSong(widget.song),
                backgroundColor: ThemeColors.bgColorPrimary(context),
                child: const Icon(Icons.share, color: Colors.white),
              ),
              FloatingActionButton(
                heroTag: 'copy_fab',
                onPressed: () => copySong(widget.song),
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
          ),
        );
      },
    );
  }
}
