import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../common/theme/theme_colors.dart';
import '../../common/utils/constants/app_assets.dart';
import '../../common/widgets/action/navigations.dart';

/// Coming Soon Screen
class ComingSoonScreen extends StatefulWidget {
  const ComingSoonScreen({Key? key}) : super(key: key);

  @override
  ComingSoonScreenState createState() => ComingSoonScreenState();
}

@visibleForTesting
class ComingSoonScreenState extends State<ComingSoonScreen> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations? tr = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1),
            Image.asset(
              AppAssets.imgConstruction,
            ).expanded(),
            const SizedBox(height: 80),
            Text(
              tr.titleComingSoon,
              style: const TextStyle(
                color: ThemeColors.blackText,
                fontWeight: FontWeight.w700,
                fontSize: 40,
              ),
            ).expanded(),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
