import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../../theme/theme_data.dart';
import '../../util/locale/localization.dart';

class DataProviderWidget
    extends BaseThemeProviderWidget<SongLibTheme, Localization> {
  const DataProviderWidget({
    Widget Function(BuildContext context, SongLibTheme theme)?
        childBuilderTheme,
    Widget Function(BuildContext context, Localization localization)?
        childBuilderLocalization,
    Widget Function(BuildContext context, SongLibTheme theme,
            Localization localization)?
        childBuilder,
  }) : super(
          childBuilderTheme: childBuilderTheme,
          childBuilderLocalization: childBuilderLocalization,
          childBuilder: childBuilder,
        );
}
