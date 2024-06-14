import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/theme/theme_fonts.dart';
import '../../common/utils/constants/app_constants.dart';
import '../../search/search_screen.dart';
import '../../search/search_songs.dart';
import '../../navigator/route_names.dart';
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
