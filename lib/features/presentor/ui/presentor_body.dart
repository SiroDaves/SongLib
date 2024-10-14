part of 'presentor_screen.dart';

class PresentorBody extends StatefulWidget {
  final PresentorScreenState parent;
  const PresentorBody({super.key, required this.parent});

  @override
  State<PresentorBody> createState() => PresentorBodyState();
}

class PresentorBodyState extends State<PresentorBody> {
  late PresentorScreenState parent;

  late AppLocalizations l10n;
  Size? size;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    l10n = AppLocalizations.of(context)!;

    return BlocConsumer(
      bloc: parent._bloc,
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
          return const CircularProgress();
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(parent.songTitle),
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    parent._bloc.add(PresentorLikeSong(parent.song));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                        parent.song.liked ? Icons.favorite : Icons.favorite_border),
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
            body: PresentorDetails(parent: widget.parent),
            floatingActionButton: PresentorFabWidget(
              song: parent.song,
            ),
          );
        }
      },
    );
  }
}
