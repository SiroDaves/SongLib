// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../common/utils/app_util.dart';
import '../../../common/repository/database_repository.dart';
import '../../../common/repository/pref_repository.dart';
import '../../../common/widgets/inputs/radio_input.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../core/di/injectable.dart';
import '../../../core/navigator/route_names.dart';
import '../../../core/theme/bloc/theme_bloc.dart';
import '../../../core/theme/theme_fonts.dart';
import '../../../core/theme/theme_styles.dart';
import '../bloc/settings_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  late ThemeBloc _themeBloc;
  late SettingsScreenState parent;
  late PrefRepository _prefRepo;
  late DatabaseRepository _dbRepo;

  bool updateFound = false, isTabletOrIpad = false;
  late AppLocalizations l10n;

  String appTheme = '';

  @override
  void initState() {
    super.initState();
    _prefRepo = getIt<PrefRepository>();
    _dbRepo = getIt<DatabaseRepository>();
    _themeBloc = context.read<ThemeBloc>();
    appTheme = getThemeModeString(_prefRepo.getThemeMode());
  }

  void onThemeChanged(ThemeMode themeMode) {
    _prefRepo.updateThemeMode(themeMode);
    _themeBloc.add(ThemeModeChanged(themeMode));
  }

  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => SettingsBloc()..add(SettingsInit()),
      child: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var widgets = [
            Text(
              l10n.displayTitle,
              style: TextStyles.headingStyle3,
            ).padding(left: Sizes.sm, top: Sizes.sm),
            Card(
              child: ListTile(
                leading: Icon(Icons.color_lens),
                title: Text(l10n.appTheme),
                subtitle: Text('${l10n.appThemeDesc} $appTheme'),
                onTap: () => selectThemeDialog(context),
              ),
            ),
            Text(
              l10n.collectionTitle,
              style: TextStyles.headingStyle3,
            ).padding(left: Sizes.sm, top: Sizes.sm),
            Card(
              child: ListTile(
                leading: Icon(Icons.library_books),
                title: Text(l10n.reselectSongbooks),
                subtitle: Text(l10n.reselectSongbooksDesc),
                onTap: onResetData,
              ),
            ),
            Text(
              l10n.presentationTitle,
              style: TextStyles.headingStyle3,
            ).padding(left: Sizes.sm, top: Sizes.sm),
            Card(
              child: ListTile(
                leading: Icon(Icons.slideshow),
                title: Text(l10n.songPresentation),
                subtitle: Text(l10n.songPresentationDesc),
                onTap: onResetData,
              ),
            ),
          ];

          return state.maybeWhen(
            failure: (feedback) => Scaffold(body: EmptyState(title: feedback)),
            orElse: () => Scaffold(
              appBar: AppBar(title: Text(l10n.appSettings)),
              body: ListView.separated(
                itemCount: widgets.length,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (_, __) => const SizedBox(height: Sizes.xs),
                padding: const EdgeInsets.all(Sizes.sm),
                itemBuilder: (context, index) {
                  return widgets[index];
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> onResetData() async {
    try {
      await _dbRepo.removeAllBooks();
      await _dbRepo.removeAllSongs();
      _prefRepo.clearData();
      CustomSnackbar.show(context, l10n.redirectingYou);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.step1Selection,
        (route) => false,
      );
    } catch (e) {
      logger('Unable to: $e');
      Sentry.captureException(e);
    }
  }

  Future<void> selectThemeDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Theme'),
          content: SizedBox(
            height: 135,
            child: RadioInput(
              initValue: appTheme,
              options: const ['System Theme', 'Light', 'Dark'],
              vertical: true,
              onChanged: (String? newValue) {
                setState(() {
                  switch (newValue) {
                    case 'Light':
                      onThemeChanged(ThemeMode.light);
                      break;
                    case 'Dark':
                      onThemeChanged(ThemeMode.dark);
                      break;
                    default:
                      onThemeChanged(ThemeMode.system);
                      break;
                  }
                  Navigator.of(context).pop();
                });
              },
            ),
          ),
        );
      },
    );
  }
}
