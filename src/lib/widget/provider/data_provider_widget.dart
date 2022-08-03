import 'package:songlib/styles/theme_data.dart';
import 'package:songlib/util/locale/localization.dart';
import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class DataProviderWidget extends BaseThemeProviderWidget<SongLibTheme, Localization> {
  const DataProviderWidget({
    Widget Function(BuildContext context, SongLibTheme theme)? childBuilderTheme,
    Widget Function(BuildContext context, Localization localization)? childBuilderLocalization,
    Widget Function(BuildContext context, SongLibTheme theme, Localization localization)? childBuilder,
  }) : super(
          childBuilderTheme: childBuilderTheme,
          childBuilderLocalization: childBuilderLocalization,
          childBuilder: childBuilder,
        );
}
