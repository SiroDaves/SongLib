import 'package:flutter/material.dart';

import '../../../theme/theme_assets.dart';
import '../../../util/constants/keys.dart';
import '../../provider/data_provider_widget.dart';
import '../action/action_item.dart';

class SongLibBackButton extends StatelessWidget {
  final VoidCallback? onClick;
  final bool fullScreen;
  final bool isLight;

  const SongLibBackButton.light({
    required this.onClick,
    this.fullScreen = false,
    Key? key,
  })  : isLight = true,
        super(key: key);

  const SongLibBackButton.dark({
    required this.onClick,
    this.fullScreen = false,
    Key? key,
  })  : isLight = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => ActionItem(
        key: Keys.backButton,
        svgAsset: getCorrectIcon(context),
        color: isLight ? theme.colorsTheme.icon : theme.colorsTheme.inverseIcon,
        onClick: onClick,
      ),
    );
  }

  String getCorrectIcon(BuildContext context) => ThemeAssets.buttonIconClose;
}
