import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/data/models/models.dart';
import '../../../../common/utils/app_util.dart';
import '../../../../common/widgets/action/bottom_nav_bar.dart';
import '../../../../common/widgets/progress/custom_snackbar.dart';
import '../../../../common/widgets/progress/skeleton.dart';
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
  int selectedPage = 0;

  List<Book> books = [];
  List<SongExt> songs = [];
  PageController pageController = PageController();

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
      create: (context) => HomeBloc()..add(FetchData()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeFetchedState) {
            books = state.books;
            songs = state.songs;
            context.read<HomeBloc>().add(FilterData(books[0]));
          } else if (state is HomeFailureState) {
            CustomSnackbar.show(
              context,
              feedbackMessage(state.feedback, l10n),
            );
          }
        },
        builder: (context, state) {
          if (state is HomeFetchingState) {
            return Scaffold(body: HomeLoading());
          } else if (state is HomeFilteredState) {
            List<PageItem> homeScreens = [
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
              //PageItem(title: 'Lists', icon: Icons.list, screen: ListsScreen()),
              //PageItem(title: 'Drafts', icon: Icons.edit, screen: DraftsScreen()),
            ];

            return Scaffold(
              appBar: AppBar(
                title: Text('SongLib'),
                actions: [
                  if (selectedPage == 0) ...[
                    IconButton(
                      icon: Icon(Icons.search),
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
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ],
              ),
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
            );
          }
          return Scaffold(body: SizedBox.shrink());
        },
      ),
    );
  }
}
