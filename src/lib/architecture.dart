import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import 'styles/theme_data.dart';
import 'util/locale/localization.dart';

L _getLocale<L>(BuildContext context) => Localization.of(context) as L;

T _getTheme<T>(BuildContext context) => SongLibTheme.of(context) as T;

Future<void> initArchitecture() async {
  await OsInfo.init();
  localizationLookup = _getLocale;
  themeLookup = _getTheme;
}
