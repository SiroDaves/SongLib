import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../../theme/theme_data.dart';
import '../../util/i10n/app_localizations.dart';

class DataProviderWidget
    extends BaseThemeProviderWidget<SongLibTheme, AppLocalizations> {
  const DataProviderWidget({
    Widget Function(BuildContext context, SongLibTheme theme)?
        childBuilderTheme,
    Widget Function(BuildContext context, AppLocalizations localization)?
        childBuilderLocalization,
    Widget Function(BuildContext context, SongLibTheme theme,
            AppLocalizations localization)?
        childBuilder,
  }) : super(
          childBuilderTheme: childBuilderTheme,
          childBuilderLocalization: childBuilderLocalization,
          childBuilder: childBuilder,
        );
}
