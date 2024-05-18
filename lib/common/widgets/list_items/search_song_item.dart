import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../data/models/songext.dart';
import '../../theme/theme_colors.dart';
import '../../theme/theme_fonts.dart';
import '../../theme/theme_styles.dart';
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

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context)!;
    final verses = song.content.split("##");

    if (song.content.contains("CHORUS")) {
      hasChorus = true;
      chorusText = tr.hasChorus;
      versesText = '${verses.length - 1} ${tr.verses}';
    } else {
      versesText = '${verses.length} ${tr.verses}';
    }

    versesText = verses.length == 1 ? versesText : '${versesText}s';
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(Sizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                songItemTitle(song.songNo, song.title),
                maxLines: 1,
                style: TextStyles.headingStyle1
                    .textColor(isSelected ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 3),
              Divider(color: ThemeColors.accent, height: height * 0.0049),
              const SizedBox(height: 3),
              Text(
                refineContent(verses[0]),
                maxLines: 2,
                style: TextStyles.bodyStyle1
                    .textColor(isSelected ? Colors.white : Colors.black)
                    .textHeight(1.5),
              ),
              SizedBox(
                height: height * 0.035,
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
