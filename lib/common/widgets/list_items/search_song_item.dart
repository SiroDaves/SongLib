import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../data/models/songext.dart';
import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_fonts.dart';
import '../../../core/theme/theme_styles.dart';
import '../../utils/app_util.dart';
import 'tag_item.dart';

// ignore: must_be_immutable
class SearchSongItem extends StatelessWidget {
  final SongExt song;
  final double height;
  final bool isSelected;
  final bool isSearching;
  final VoidCallback? onPressed;

  SearchSongItem({
    super.key,
    required this.song,
    required this.height,
    this.isSelected = false,
    this.isSearching = false,
    this.onPressed,
  });

  bool hasChorus = false;
  String chorusText = '', versesText = '';
  ThemeMode? themeMode;

  @override
  Widget build(BuildContext context) {
    final verses = song.content.split("##");

    if (song.content.contains("CHORUS")) {
      hasChorus = true;
      chorusText = 'Chorus';
      versesText = '${verses.length - 1} V';
    } else {
      versesText = '${verses.length} V';
    }

    versesText = verses.length == 1 ? versesText : '${versesText}s';

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? ThemeColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(Sizes.xs),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            [
              Text(
                songItemTitle(song.songNo, song.title),
                maxLines: 1,
                style: TextStyles.headingStyle3.textColor(
                  ThemeColors.foreColorBW(context),
                ),
              ).expanded(),
              if (isSearching) ...[
                TagItem(tagText: refineTitle(song.songbook), height: height),
              ],
              TagItem(tagText: versesText, height: height),
              if (hasChorus) TagItem(tagText: chorusText, height: height),
              Icon(
                song.liked ? Icons.favorite : Icons.favorite_border,
                color: ThemeColors.foreColorBW(context),
              )
            ].toRow(),
            const SizedBox(height: 3),
            Divider(color: ThemeColors.foreColorPrimary1(context), height: 1),
            [
              Text(
                refineContent(verses[0]),
                maxLines: 2,
                style: TextStyles.bodyStyle2
                    .textColor(
                      ThemeColors.foreColorBW(context),
                    )
                    .textHeight(1.5),
              ).expanded(),
            ].toRow(),
          ],
        ),
      ),
    );
  }
}
