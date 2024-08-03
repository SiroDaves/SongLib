import 'package:flutter/material.dart';

import '../../../common/utils/constants/app_assets.dart';
import '../../../common/utils/constants/app_constants.dart';
import '../../../common/utils/constants/pref_constants.dart';
import '../../../common/utils/date_util.dart';
import '../../../core/di/injectable.dart';
import '../../../core/local_storage.dart';
import '../../../core/navigator/route_names.dart';
import '../../../core/theme/theme_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late LocalStorage _localStorage;

  @override
  void initState() {
    super.initState();
    _localStorage = getIt<LocalStorage>();
    nextPageAction();
  }

  Future<void> nextPageAction() async {
    bool isSelected =
        _localStorage.getPrefBool(PrefConstants.dataIsSelectedKey);
    bool isLoaded = _localStorage.getPrefBool(PrefConstants.dataIsLoadedKey);
    await Future.delayed(const Duration(seconds: 3), () {});

    if (isLoaded) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.home,
        (route) => false,
      );
    } else {
      if (isSelected) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.saving,
          (route) => false,
        );
      } else {
        _localStorage.setPrefString(
          PrefConstants.dateInstalledKey,
          dateNow(),
        );
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.selecting,
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var withLoveFromRow = const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'with ',
          style: TextStyle(
            fontSize: 30,
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
            color: ThemeColors.primary,
          ),
        ),
        Icon(
          Icons.favorite_rounded,
          color: ThemeColors.primaryDark,
        ),
        Text(
          ' from',
          style: TextStyle(
            fontSize: 30,
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
            color: ThemeColors.primary,
          ),
        ),
      ],
    );

    var appDevelopers = const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Names app developers in splash screen
        Text(
          AppConstants.appCredits1,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ThemeColors.primaryDark,
          ),
        ),
        Text(
          ' & ',
          style: TextStyle(
            fontSize: 20,
            color: ThemeColors.primary,
          ),
        ),
        Text(
          AppConstants.appCredits2,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ThemeColors.primaryDark,
          ),
        ),
      ],
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            // Shows app icon on splash screen
            Image.asset(AppAssets.appIcon, height: 200, width: 200),
            const SizedBox(height: 10),
            const Text(
              AppConstants.appTitle,
              style: TextStyle(
                fontSize: 50,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                color: ThemeColors.primary,
              ),
            ),
            const SizedBox(height: 5),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                color: ThemeColors.primaryDark,
                thickness: 2,
                height: 50,
              ),
            ),
            withLoveFromRow,
            appDevelopers,
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
