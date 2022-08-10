import 'package:songlib/model/data/enums.dart';
import 'package:songlib/screen/base/simple_screen.dart';
import 'package:songlib/widget/general/styled/songlib_button.dart';
import 'package:songlib/widget/menu_background/menu_box.dart';
import 'package:songlib/widget/provider/data_provider_widget.dart';
import 'package:flutter/material.dart';

class FollowWidget extends StatelessWidget {
  final ValueChanged<FollowType> onFollow;
  final String followAmount;

  const FollowWidget({
    required this.onFollow,
    required this.followAmount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => SimpleScreen(
        transparant: true,
        child: MenuBox(
          title: localization.followTitle,
          child: Center(
            heightFactor: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${localization.followAmount} $followAmount',
                  style: theme.coreTextTheme.bodyNormal,
                ),
                const SizedBox(height: 8),
                SongLibButton(
                  type: SongLibButtonType.green,
                  text: localization.followFollow,
                  onClick: () => onFollow(FollowType.follow),
                ),
                SongLibButton(
                  type: SongLibButtonType.blue,
                  text: localization.followLeave,
                  onClick: () => onFollow(FollowType.leave),
                ),
                SongLibButton(
                  type: SongLibButtonType.yellow,
                  text: localization.followAuto,
                  onClick: () => onFollow(FollowType.autoFollow),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
