import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/theme/theme_colors.dart';
import '../../../common/theme/theme_styles.dart';
import '../../../common/widgets/list_items/search_book_item.dart';
import '../../../common/widgets/list_items/search_song_item.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../common/widgets/progress/line_progress.dart';
import '../../../data/models/songext.dart';
import '../bloc/search_bloc.dart';

part 'search_screen_body.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.gray,
      body: BlocProvider(
        create: (context) {
          return SearchBloc();
        },
        child: const SearchScreenBody(),
      ),
    );
  }
}
