import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../../theme/app_themes.dart';
import '../../utils/locale/localization.dart';

class ProviderWidget<T extends ChangeNotifier>
    extends BaseProviderWidget<T, AppThemeData, Localization> {
  const ProviderWidget({
    required T Function() create,
    Widget? child,
    Widget Function(BuildContext context, AppThemeData theme,
            Localization localization)?
        childBuilder,
    Widget Function(
      BuildContext context,
      T viewModel,
      AppThemeData theme,
      Localization localization,
    )?
        childBuilderWithViewModel,
    Widget? consumerChild,
    Widget Function(BuildContext context, T viewModel, Widget? child)? consumer,
    Widget Function(
      BuildContext context,
      T viewModel,
      Widget? child,
      AppThemeData theme,
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
