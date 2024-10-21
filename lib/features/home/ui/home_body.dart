part of 'home_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => HomeBodyState();
}

class HomeBodyState extends State<HomeBody> {
  late final HomeBloc _bloc;

  PageController pageController = PageController();
  bool isTabletOrIpad = false;
  int selectedPageIndex = 0;

  List<PageItem> pages = [
    PageItem(title: 'Songs', icon: Icons.search, screen: SongsScreen()),
    PageItem(title: 'Likes', icon: Icons.favorite, screen: LikesScreen()),
    //PageItem(title: 'Lists', icon: Icons.list, screen: ListsScreen()),
    //PageItem(title: 'Drafts', icon: Icons.edit, screen: DraftsScreen()),
  ];

  @override
  void initState() {
    super.initState();
    _bloc = getIt<HomeBloc>();
    selectedPageIndex = pageController.initialPage;

    if (isMobile) {
      checkPermissions(context);
      if (FlavorConfig.isProd()) {
        PackageInfo packageInfo = PackageInfo(
          appName: '',
          packageName: '',
          version: '',
          buildNumber: '',
        );
        _bloc.add(HomeCheckVersion(packageInfo.version));
      }
    }
    _bloc.add(const HomeFetchData());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context)!;
    isTabletOrIpad = size.shortestSide > 550;

    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is FailureState) {
          CustomSnackbar.show(
            context,
            feedbackMessage(state.feedback, l10n),
          );
        }
      },
      builder: (context, state) {
        if (state is ProgressState) {
          return const SkeletonLoading();
        } else if (state is FailureState) {
          return EmptyState(
            title: emptyStateMessage(state.feedback, l10n),
            showRetry: true,
            onRetry: () => _bloc.add(const HomeFetchData()),
          );
        } else if (state is LoadedState) {
          if (state.books.isNotEmpty && state.songs.isNotEmpty) {
            return isTabletOrIpad
                ? HomePc(parent: this)
                : HomeMobile(parent: this);
          } else {
            return EmptyState(
              title: 'Sorry nothing to show here at the moment.',
              showRetry: true,
              onRetry: () => _bloc.add(const HomeFetchData()),
            );
          }
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void onPageChanged(int index) {
    setState(() {
      selectedPageIndex = index;
      if (!isTabletOrIpad) {
        pageController.jumpToPage(index);
      }
    });
  }
}
