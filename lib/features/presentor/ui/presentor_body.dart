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
  late PresentorBloc _bloc;
  late PresentorScreenState parent;

  bool updateFound = false;
  bool isTabletOrIpad = false;
  late AppLocalizations l10n;
  late SongExt song;
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
    song = widget.song;
    l10n = AppLocalizations.of(context)!;
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
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.songTitle),
            actions: <Widget>[
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.favorite),
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
          body: state.status == Status.inProgress
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
        );
      },
    );
  }
}
