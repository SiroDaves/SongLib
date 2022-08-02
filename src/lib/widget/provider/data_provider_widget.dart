import 'package:flutter/widgets.dart';
import 'package:songlib/styles/theme_data.dart';
import 'package:songlib/util/locale/localization.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class DataProviderWidget extends BaseThemeProviderWidget<MyappTheme, Localization> {
  const DataProviderWidget({
    Widget Function(BuildContext context, MyappTheme theme)? childBuilderTheme,
    Widget Function(BuildContext context, Localization localization)? childBuilderLocalization,
    Widget Function(BuildContext context, MyappTheme theme, Localization localization)? childBuilder,
  }) : super(
          childBuilderTheme: childBuilderTheme,
          childBuilderLocalization: childBuilderLocalization,
          childBuilder: childBuilder,
        );
}
