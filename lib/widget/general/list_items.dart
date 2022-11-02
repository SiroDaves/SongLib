import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../model/base/book.dart';
import '../../model/base/draft.dart';
import '../../model/base/listed.dart';
import '../../model/base/songext.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../util/constants/utilities.dart';
import 'labels.dart';

var locale = 'en';

class BookItem extends StatelessWidget {
  final Book book;
  final bool selected;
  final Function()? onTap;

  const BookItem({
    Key? key,
    required this.book,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'BookItem_${book.objectId}',
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: selected ? Colors.deepOrange : Colors.white,
          elevation: 5,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  selected ? Icons.check_box : Icons.check_box_outline_blank,
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
              textContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget textContainer() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            refineTitle(book.title!),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "${book.songs!} ${book.subTitle} songs",
            style: TextStyle(
              fontSize: 16,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class SongBook extends StatelessWidget {
  final Book book;
  final double height;
  final Function()? onTap;

  const SongBook({
    Key? key,
    required this.book,
    required this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'BookIndex_${book.objectId}',
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: height * 0.1958,
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: ThemeColors.primary,
            border: Border.all(color: Colors.white),
            boxShadow: const [BoxShadow(blurRadius: 3)],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              '${truncateString(19, refineTitle(book.title!))} (${book.songs})',
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(
                color: Colors.white,
                fontSize: height * 0.0228,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListedItem extends StatelessWidget {
  final Listed listed;
  final double height;
  final Function()? onTap;

  const ListedItem({
    Key? key,
    required this.listed,
    required this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateValue = DateTime.parse(listed.updatedAt!);
    final String lastUpdate = timeago.format(dateValue);

    return Hero(
      tag: 'ListedIndex_${listed.id}',
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          margin: EdgeInsets.only(right: 5, bottom: height * 0.0049),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  listed.title!,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: height * 0.0261,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(color: ThemeColors.accent, height: height * 0.0049),
                const SizedBox(height: 5),
                listed.description!.isNotEmpty
                    ? Text(
                        listed.description!,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: height * 0.015,
                        ),
                      )
                    : Container(),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    TagView(
                      tagText: '${listed.song!} song${listed.song! == 1 ? '' : 's'}',
                      height: height,
                    ),
                    TagView(tagText: 'Updated $lastUpdate', height: height),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SongItem extends StatelessWidget {
  final SongExt song;
  final double height;
  final Function()? onTap;

  SongItem({
    Key? key,
    required this.song,
    required this.height,
    this.onTap,
  }) : super(key: key);

  bool hasChorus = false;
  String chorusText = '', versesText = '';

  @override
  Widget build(BuildContext context) {
    final verses = song.content!.split("##");

    if (song.content!.contains("CHORUS")) {
      hasChorus = true;
      chorusText = AppConstants.hasChorus;
      versesText = '${verses.length - 1} ${AppConstants.verses}';
    } else {
      versesText = '${verses.length} ${AppConstants.verses}';
    }

    versesText = verses.length == 1 ? versesText : '${versesText}s';

    return Hero(
      tag: 'SongIndex_${song.id}',
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          margin: EdgeInsets.only(bottom: height * 0.0049),
          child: Padding(
            padding: EdgeInsets.all(height * 0.0049),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  songItemTitle(song.songNo!, song.title!),
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: height * 0.0261,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(color: ThemeColors.accent, height: height * 0.0049),
                Text(
                  refineContent(verses[0]),
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: height * 0.0228,
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    TagView(
                        tagText: refineTitle(song.songbook!), height: height),
                    TagView(tagText: versesText, height: height),
                    hasChorus
                        ? TagView(tagText: chorusText, height: height)
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DraftItem extends StatelessWidget {
  final Draft draft;
  final double height;
  final Function()? onTap;

  DraftItem({
    Key? key,
    required this.draft,
    required this.height,
    this.onTap,
  }) : super(key: key);

  bool hasChorus = false;
  String chorusText = '', versesText = '';

  @override
  Widget build(BuildContext context) {
    final verses = draft.content!.split("##");

    if (draft.content!.contains("CHORUS")) {
      hasChorus = true;
      chorusText = AppConstants.hasChorus;
      versesText = '${verses.length - 1} ${AppConstants.verses}';
    } else {
      versesText = '${verses.length} ${AppConstants.verses}';
    }

    versesText = verses.length == 1 ? versesText : '${versesText}s';

    return Hero(
      tag: 'DraftIndex_${draft.id}',
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          margin: EdgeInsets.only(bottom: height * 0.0049),
          child: Padding(
            padding: EdgeInsets.all(height * 0.0049),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  draft.title!,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: height * 0.0261,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(color: ThemeColors.accent, height: height * 0.0049),
                Text(
                  refineContent(verses[0]),
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: height * 0.0228,
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    TagView(tagText: versesText, height: height),
                    hasChorus
                        ? TagView(tagText: chorusText, height: height)
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
