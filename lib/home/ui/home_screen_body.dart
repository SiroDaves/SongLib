part of 'home_screen.dart';

class HomeScreenBody extends StatefulWidget {
  final HomeScreenState parent;
  const HomeScreenBody({super.key, required this.parent});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late HomeBloc _bloc;
  late HomeScreenState parent;

  bool updateFound = false;
  bool isTabletOrIpad = false;
  late AppLocalizations tr;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();

  }

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return parent.homePages.elementAt(parent._currentPage);
      },
    );
  }
}
