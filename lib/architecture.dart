import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import 'theme/app_themes.dart';
import 'utils/locale/localization.dart';

L _getLocale<L>(BuildContext context) => Localization.of(context) as L;

T _getTheme<T>(BuildContext context) => AppTheme.of(context) as T;

Future<void> initArchitecture() async {
  await OsInfo.init();
  localizationLookup = _getLocale;
  themeLookup = _getTheme;
}
