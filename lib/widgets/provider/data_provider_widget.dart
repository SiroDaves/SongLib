import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../../theme/app_themes.dart';
import '../../utils/locale/localization.dart';

class DataProviderWidget
    extends BaseThemeProviderWidget<AppThemeData, Localization> {
  const DataProviderWidget({
    Widget Function(BuildContext context, AppThemeData theme)?
        childBuilderTheme,
    Widget Function(BuildContext context, Localization localization)?
        childBuilderLocalization,
    Widget Function(BuildContext context, AppThemeData theme,
            Localization localization)?
        childBuilder,
  }) : super(
          childBuilderTheme: childBuilderTheme,
          childBuilderLocalization: childBuilderLocalization,
          childBuilder: childBuilder,
        );
}
