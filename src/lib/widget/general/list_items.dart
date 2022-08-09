import 'package:flutter/material.dart';

import '../../model/base/book.dart';
import '../../model/base/draft.dart';
import '../../model/base/listed.dart';
import '../../model/base/song.dart';
import '../../styles/theme_colors.dart';
import '../../styles/theme_fonts.dart';
import '../../util/app_constants.dart';
import '../../util/utilities.dart';
import 'labels.dart';

class BookItem extends StatelessWidget {
  final Book book;
  final bool selected;
  final Function()? onTap;

  const BookItem({
    Key? key,
    required this.book,
    required this.selected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    return Hero(
      tag: 'ListedIndex_${listed.id}',
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          margin: EdgeInsets.only(right: 5, bottom: height * 0.0049),
          child: Padding(
            padding: EdgeInsets.all(height * 0.0049),
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
                Text(
                  'Updated ${listed.updatedAt!}',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: height * 0.015,
                  ),
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

class SongGrid extends StatelessWidget {
  final Song song;
  final List<Book> books;
  final double height;
  final Function()? onTap;

  const SongGrid({
    Key? key,
    required this.song,
    required this.books,
    required this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Book book = books.firstWhere((item) => item.bookNo == song.book);
    return Hero(
      tag: 'SongGrid_${song.objectId}',
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          margin: EdgeInsets.only(right: 5, bottom: height * 0.0049),
          child: Container(
            width: height * 0.1958,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  truncateString(20, songItemTitle(song.book!, song.title!)),
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: height * 0.0228,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  book.title!.isNotEmpty ? truncateString(20, book.title!) : '',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: height * 0.0175,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SongItem extends StatelessWidget {
  final Song song;
  final double height;
  final Function()? onTap;

  const SongItem({
    Key? key,
    required this.song,
    required this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String hasChorus = '', verseCount = '';
    var verses = song.content!.split("##");

    if (song.content!.contains("CHORUS")) {
      hasChorus = AppConstants.hasChorus;
      verseCount = '${verses.length} Vs';
    } else {
      hasChorus = AppConstants.noChorus;
      verseCount = '${verses.length} Vs';
    }

    return Hero(
      tag: 'SongIndex_${song.id}',
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          margin: EdgeInsets.only(right: 5, bottom: height * 0.0049),
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
                    //tagView(songBook),
                    TagView(tagText: hasChorus, height: height),
                    TagView(tagText: verseCount, height: height),
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

class DraftItem extends StatelessWidget {
  final Draft draft;
  final double height;
  final Function()? onTap;

  const DraftItem({
    Key? key,
    required this.draft,
    required this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String hasChorus = '', verseCount = '';
    var verses = draft.content!.split("##");

    if (draft.content!.contains("CHORUS")) {
      hasChorus = AppConstants.hasChorus;
      verseCount = '${verses.length} Vs';
    } else {
      hasChorus = AppConstants.noChorus;
      verseCount = '${verses.length} Vs';
    }

    return Hero(
      tag: 'SongIndex_${draft.id}',
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          margin: EdgeInsets.only(right: 5, bottom: height * 0.0049),
          child: Padding(
            padding: EdgeInsets.all(height * 0.0049),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  songItemTitle(draft.songNo!, draft.title!),
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
                    TagView(tagText: hasChorus, height: height),
                    TagView(tagText: verseCount, height: height),
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
