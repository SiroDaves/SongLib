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

part 'views/small_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Timer? _syncTimer;
  bool periodicSyncStarted = false;

  late HomeBloc _bloc;
  int selectedPage = 0, selectedBook = 0;
  List<Book> books = [];
  List<SongExt> songs = [];
  PageController pageController = PageController();

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
            try {
              books = state.books;
              songs = state.songs;
              _bloc.add(FilterData(books[selectedBook]));
            } catch (e) {
              logger("Unable to set books and songs: $e");
              CustomSnackbar.show(context, "Unable to set books and songs");
            }
          } else if (state is HomeDataFetchedState) {
            try {
              books = state.books;
              songs = state.songs;
              _bloc.add(FilterData(books[selectedBook]));
            } catch (e) {
              logger("Unable to set books and songs: $e");
              CustomSnackbar.show(context, "Unable to set books and songs");
            }
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
          return state.maybeWhen(
            orElse: () => Scaffold(body: HomeLoading()),
            fetching: () => Scaffold(body: HomeLoading()),
            filtered: (book, songs, likes) => SmallScreen(parent: this),
          );
        },
      ),
    );
  }
}
