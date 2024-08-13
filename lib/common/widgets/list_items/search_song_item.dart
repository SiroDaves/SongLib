import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    Key? key,
    required this.song,
    required this.height,
    this.isSelected = false,
    this.isSearching = false,
    this.onPressed,
  }) : super(key: key);

  bool hasChorus = false;
  String chorusText = '', versesText = '';
  ThemeMode? themeMode;

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    final verses = song.content.split("##");

    if (song.content.contains("CHORUS")) {
      hasChorus = true;
      chorusText = l10n.hasChorus;
      versesText = '${verses.length - 1} ${l10n.verses}';
    } else {
      versesText = '${verses.length} ${l10n.verses}';
    }

    versesText = verses.length == 1 ? versesText : '${versesText}s';
    
    Color unSelectedColor = Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Colors.grey;
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 2,
        color: unSelectedColor,
        child: Container(
          decoration: BoxDecoration(
            color: unSelectedColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(Sizes.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                songItemTitle(song.songNo, song.title),
                maxLines: 1,
                style: TextStyles.headingStyle1
                    .textColor(isSelected ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 5),
              Divider(
                  color: Theme.of(context).brightness == Brightness.light
                      ? ThemeColors.primary
                      : Colors.white,
                  height: 2),
              const SizedBox(height: 3),
              Text(
                refineContent(verses[0]),
                maxLines: 2,
                style: TextStyles.bodyStyle1
                    .textColor(isSelected ? Colors.white : Colors.black)
                    .textHeight(1.5),
              ),
              SizedBox(
                height: 25,
                width: MediaQuery.of(context).size.width - 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    if (isSearching)
                      TagItem(
                          tagText: refineTitle(song.songbook), height: height),
                    TagItem(tagText: versesText, height: height),
                    if (hasChorus) TagItem(tagText: chorusText, height: height),
                    Container(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
