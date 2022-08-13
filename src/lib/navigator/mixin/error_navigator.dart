import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../../util/locale/localization.dart';
import '../../widget/provider/data_provider_widget.dart';

abstract class ErrorNavigator {
  String? showError(dynamic error);

  void showErrorWithLocaleKey(String errorGeneral, {List<dynamic>? args});
}

mixin ErrorNavigatorMixin<T extends StatefulWidget> on State<T>
    implements ErrorNavigator {
  @override
  String? showError(dynamic error) {
    String key;
    if (error is String) {
      _showError(error);
      return null;
    } else if (error is LocalizedError) {
      key = error.getLocalizedKey();
    } else {
      logger.warning(
          'Caught an error that is not handled by the SongLibError $error');
      key = 'Something went wrong';
    }
    showErrorWithLocaleKey(key);
    return key;
  }

  void _showError(String error) {
    final snackBar = SnackBar(
      content: DataProviderWidget(
        childBuilderTheme: (context, theme) => Text(
          error,
          style: theme.inverseCoreTextTheme.labelButtonSmall,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void showErrorWithLocaleKey(String errorKey, {List<dynamic>? args}) =>
      _showError(
        Localization.of(context).getTranslation(errorKey, args: args),
      );
}
