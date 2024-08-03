import 'package:flutter/material.dart';

import '../../../core/navigator/route_names.dart';
import '../../../core/theme/theme_colors.dart';

class PresentorMenu extends StatelessWidget {
  const PresentorMenu({super.key});

  void _onSelected(BuildContext context, int result) {
    switch (result) {
      case 1:
        Navigator.pushNamed(context, RouteNames.settings);
        break;
        
      case 2:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      color: ThemeColors.bgColorPrimary(context),
      onSelected: (int result) {
        _onSelected(context, result);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
          value: 1,
          child: Text('App Settings'),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text('Change App Theme'),
        ),
      ],
    );
  }
}
