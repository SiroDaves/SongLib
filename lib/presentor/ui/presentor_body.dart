part of 'presentor_screen.dart';

class PresentorScreenBody extends StatefulWidget {
  final PresentorScreenState parent;
  const PresentorScreenBody({super.key, required this.parent});

  @override
  State<PresentorScreenBody> createState() => _PresentorScreenBodyState();
}

class _PresentorScreenBodyState extends State<PresentorScreenBody> {
  late PresentorBloc _bloc;
  late PresentorScreenState parent;

  bool updateFound = false;
  bool isTabletOrIpad = false;
  late AppLocalizations tr;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<PresentorBloc>();
    _bloc.add(PresentorHistory(parent.song));
  }

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    return BlocConsumer<PresentorBloc, PresentorState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return const SizedBox();
      },
    );
  }
}
