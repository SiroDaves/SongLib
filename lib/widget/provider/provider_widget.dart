import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../../theme/theme_data.dart';
import '../../util/locale/localization.dart';

class ProviderWidget<T extends ChangeNotifier>
    extends BaseProviderWidget<T, SongLibTheme, Localization> {
  const ProviderWidget({
    required T Function() create,
    Widget? child,
    Widget Function(BuildContext context, SongLibTheme theme,
            Localization localization)?
        childBuilder,
    Widget Function(
      BuildContext context,
      T viewModel,
      SongLibTheme theme,
      Localization localization,
    )?
        childBuilderWithViewModel,
    Widget? consumerChild,
    Widget Function(BuildContext context, T viewModel, Widget? child)? consumer,
    Widget Function(
      BuildContext context,
      T viewModel,
      Widget? child,
      SongLibTheme theme,
      Localization localization,
    )?
        consumerWithThemeAndLocalization,
    bool lazy = true,
  }) : super(
          create: create,
          child: child,
          childBuilder: childBuilder,
          childBuilderWithViewModel: childBuilderWithViewModel,
          consumerChild: consumerChild,
          consumer: consumer,
          consumerWithThemeAndLocalization: consumerWithThemeAndLocalization,
          lazy: lazy,
        );
}
