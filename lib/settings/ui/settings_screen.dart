import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/theme/bloc/theme_bloc.dart';
import '../../common/theme/theme_styles.dart';
import '../../common/utils/app_util.dart';
import '../../common/widgets/inputs/radio_input.dart';
import '../../data/models/book.dart';
import '../../data/models/songext.dart';
import '../../data/repository/local_storage.dart';
import '../../di/injectable.dart';
import '../bloc/settings_bloc.dart';

part 'settings_body.dart';

class SettingsScreen extends StatefulWidget {
  final bool isDialog;
  const SettingsScreen({super.key, this.isDialog = false});

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
        automaticallyImplyLeading: widget.isDialog,
        title: const Text('SongLib Settings'),
        actions: <Widget>[
          widget.isDialog
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(right: Sizes.m),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
        ],
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
