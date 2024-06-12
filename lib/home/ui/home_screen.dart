import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/theme/theme_colors.dart';
import '../../common/utils/app_util.dart';
import '../../common/utils/constants/app_constants.dart';
import '../../common/widgets/inputs/radio_input.dart';
import '../../data/repository/local_storage.dart';
import '../../di/injectable.dart';
import '../../lists/search/search_screen.dart';
import '../../lists/search/search_songs.dart';
import '../bloc/home_bloc.dart';

part 'home_screen_body.dart';
part 'mobile/home_screen_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) {
        return HomeBloc();
      },
      child: const HomeScreenBody(),
    );
  }
}
