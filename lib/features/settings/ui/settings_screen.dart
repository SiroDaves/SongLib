import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/theme/bloc/theme_bloc.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/widgets/inputs/radio_input.dart';
import '../../../common/data/models/book.dart';
import '../../../common/data/models/songext.dart';
import '../../../common/repository/local_storage.dart';
import '../../../core/di/injectable.dart';
import '../bloc/settings_bloc.dart';

part 'settings_body.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool isTabletOrIpad = false;
  late AppLocalizations tr;

  late SongExt song;
  late List<Book> books;
  late List<SongExt> songs;

  @override
  Widget build(BuildContext context) {
    tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocProvider(
        create: (context) {
          return SettingsBloc();
        },
        child: SettingsScreenBody(parent: this),
      ),
    );
  }
}
