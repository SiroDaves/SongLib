import 'dart:async';
import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../../common/data/models/models.dart';
import '../../../../common/utils/api_util.dart';
import '../../../../common/utils/app_util.dart';
import '../../../../common/utils/constants/app_assets.dart';
import '../../../../common/widgets/action/bottom_nav_bar.dart';
import '../../../../common/widgets/general/fading_index_stack.dart';
import '../../../../common/widgets/progress/custom_snackbar.dart';
import '../../../../common/widgets/progress/skeleton.dart';
import '../../../../core/navigator/route_names.dart';
import '../../../../core/theme/theme_colors.dart';
import '../../../../core/theme/theme_fonts.dart';
import '../../../../core/theme/theme_styles.dart';
import '../../../settings/ui/settings_screen.dart';
import '../../songs/ui/songs_search.dart';
import '../../likes/ui/likes_screen.dart';
import '../../songs/ui/songs_screen.dart';
import '../bloc/home_bloc.dart';

part 'views/big_screen.dart';
part 'views/small_screen.dart';
part 'widgets/search_widget.dart';
part 'widgets/sidebar.dart';
part 'widgets/sidebar_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late HomeBloc _bloc;
  Timer? _syncTimer;
  
  bool periodicSyncStarted = false;
  int selectedPage = 0, selectedBook = 0;
  List<Book> books = [];
  List<SongExt> songs = [];
  PageController pageController = PageController();
  TextEditingController? searchController = TextEditingController();

  PageType setPage = PageType.search;

  @override
  void dispose() {
    _syncTimer?.cancel();
    super.dispose();
  }

  void startPeriodicSync() {
    periodicSyncStarted = true;
    _syncTimer = Timer.periodic(Duration(minutes: 5), (_) async {
      if (await isConnectedToInternet()) _bloc.add(SyncData());
    });
  }

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => HomeBloc()..add(FetchData()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          _bloc = context.read<HomeBloc>();
          if (state is HomeDataSyncedState) {
            books = state.books;
            songs = state.songs;
            _bloc.add(FilterData(books[selectedBook]));
          } else if (state is HomeDataFetchedState) {
            books = state.books;
            songs = state.songs;
            _bloc.add(FilterData(books[selectedBook]));
            if (!periodicSyncStarted) startPeriodicSync();
          } else if (state is HomeFilteredState) {
            selectedBook = books.indexOf(state.book);
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
          var homeView = MediaQuery.of(context).size.shortestSide > 550
              ? BigScreen(parent: this)
              : SmallScreen(parent: this);
          return state.maybeWhen(
            fetching: () => Scaffold(body: HomeLoading()),
            orElse: () => homeView,
            filtered: (book, songs, likes) => homeView,
            synced: (book, songs) => homeView,
          );
        },
      ),
    );
  }
}
