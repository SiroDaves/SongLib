import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/data/models/models.dart';
import '../../../../common/utils/api_util.dart';
import '../../../../common/utils/app_util.dart';
import '../../../../common/widgets/action/bottom_nav_bar.dart';
import '../../../../common/widgets/progress/custom_snackbar.dart';
import '../../../../common/widgets/progress/skeleton.dart';
import '../../../../core/navigator/route_names.dart';
import '../../songs/ui/songs_search.dart';
import '../../likes/ui/likes_screen.dart';
import '../../songs/ui/songs_screen.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Timer? _syncTimer;
  late HomeBloc _bloc;
  bool periodicSyncStarted = false;
  int selectedPage = 0, selectedBook = 0;
  List<Book> books = [];
  List<SongExt> songs = [];
  List<PageItem> homeScreens = [];
  PageController pageController = PageController();

  @override
  void dispose() {
    _syncTimer?.cancel();
    super.dispose();
  }

  void startPeriodicSync() {
    periodicSyncStarted = true;
    _syncTimer = Timer.periodic(Duration(minutes: 5), (_) async {
      if (await isConnectedToInternet()) _bloc.add(FetchData());
    });
  }

  void onPageChanged(int index) {
    setState(() {
      selectedPage = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => HomeBloc()..add(SyncData()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          _bloc = context.read<HomeBloc>();
          if (state is HomeDataSyncedState) {
            if (state.success) _bloc.add(FetchData());
            if (!periodicSyncStarted) {
              _bloc.add(FetchData());
              startPeriodicSync();
            }
          } else if (state is HomeDataFetchedState) {
            books = state.books;
            songs = state.songs;
            _bloc.add(FilterData(books[selectedBook]));
          } else if (state is HomeFilteredState) {
            selectedBook = books.indexOf(state.book);
            homeScreens = [
              PageItem(
                title: 'Songs',
                icon: Icons.search,
                screen: SongsScreen(books: books),
              ),
              PageItem(
                title: 'Likes',
                icon: Icons.favorite,
                screen: LikesScreen(books: books),
              ),
            ];
          } else if (state is HomeFailureState) {
            CustomSnackbar.show(context, feedbackMessage(state.feedback, l10n));
          } else if (state is HomeResettedState) {
            CustomSnackbar.show(context, l10n.redirectingYou);
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.step1Selection,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(l10n.appName),
              actions: [
                if (selectedPage == 0) ...[
                  IconButton(
                    icon: Platform.isIOS
                        ? Icon(CupertinoIcons.search)
                        : Icon(Icons.search),
                    onPressed: () async {
                      showSearch(
                        context: context,
                        delegate: SongsSearch(
                          context,
                          books,
                          songs,
                          size.height * 0.5,
                        ),
                      );
                    },
                  ),
                ],
                IconButton(
                  icon: Platform.isIOS
                      ? Icon(CupertinoIcons.settings)
                      : Icon(Icons.settings),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.settings);
                  },
                ),
              ],
            ),
            body: state.maybeWhen(
              orElse: () => HomeLoading(),
              fetching: () => HomeLoading(),
              filtered: (book, songs, likes) => Scaffold(
                body: PageView(
                  controller: pageController,
                  onPageChanged: onPageChanged,
                  physics: const NeverScrollableScrollPhysics(),
                  children: homeScreens.map((item) => item.screen).toList(),
                ),
                bottomNavigationBar: CustomBottomNavigationBar(
                  selectedIndex: selectedPage,
                  onPageChange: onPageChanged,
                  pages: homeScreens,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
