import 'package:songlib/styles/theme_assets.dart';
import 'package:songlib/util/keys.dart';
import 'package:songlib/widget/general/action/action_item.dart';
import 'package:songlib/widget/provider/data_provider_widget.dart';
import 'package:flutter/material.dart';

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
