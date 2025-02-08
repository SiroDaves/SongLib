import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../data/models/songext.dart';
import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_fonts.dart';
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
    var foreColor = Theme.of(context).colorScheme.brightness == Brightness.light
        ? ThemeColors.accent1
        : ThemeColors.primaryDark1;

    var btnContents = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        [
          Text(
            songItemTitle(song.songNo, song.title),
            maxLines: 1,
            style: TextStyles.headingStyle3.textColor(foreColor),
          ).expanded(),
          if (isSearching) ...[
            TagItem(tagText: refineTitle(song.songbook), height: height),
          ],
          TagItem(tagText: versesText, height: height),
          if (hasChorus) TagItem(tagText: chorusText, height: height),
          Icon(
            song.liked ? Icons.favorite : Icons.favorite_border,
            color: foreColor,
          )
        ].toRow(),
        const SizedBox(height: 3),
        Divider(color: foreColor, height: 1),
        [
          Text(
            refineContent(verses[0]),
            maxLines: 2,
            style: TextStyles.bodyStyle2.textColor(foreColor).textHeight(1.5),
          ).expanded(),
        ].toRow(),
      ],
    );
    return RawMaterialButton(
      textStyle: TextStyles.buttonTextStyle.bold
          .size(20)
          .textColor(isSelected ? Colors.white : Colors.black),
      fillColor: isSelected ? ThemeColors.primary : Colors.transparent,
      highlightColor: Colors.white.withValues(alpha: .1),
      focusElevation: 0,
      hoverColor: ThemeColors.accent2,
      hoverElevation: 1,
      highlightElevation: 0,
      elevation: 0,
      padding: EdgeInsets.all(5),
      onPressed: onPressed,
      child: btnContents,
    );
  }
}
