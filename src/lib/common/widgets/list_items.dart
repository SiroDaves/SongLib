import 'package:flutter/material.dart';

import '../../exports.dart';

class BookItem extends StatelessWidget {
  final Book book;
  final bool selected;

  const BookItem({
    Key? key,
    required this.book,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }

  Widget textContainer() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            refineTitle(book.title),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "${book.songs!} ${book.subtitle} songs",
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

  const SongBook({Key? key, required this.book, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'BookIndex_${book.objectId}',
      child: Container(
        width: height * 0.1958,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          border: Border.all(color: AppColors.white),
          boxShadow: const [BoxShadow(blurRadius: 3)],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            '${truncateString(19, refineTitle(book.title))} (${book.songs})',
            textAlign: TextAlign.center,
            maxLines: 3,
            style: normalTextStyle.copyWith(
              color: AppColors.white,
              fontSize: height * 0.0228,
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

  const ListedItem({Key? key, required this.listed, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'ListedIndex_${listed.id}',
      child: Card(
        elevation: 2,
        margin: EdgeInsets.only(right: 5, bottom: height * 0.0049),
        child: Padding(
          padding: EdgeInsets.all(height * 0.0049),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                listed.title,
                maxLines: 1,
                style: titleTextStyle.copyWith(
                  fontSize: height * 0.0261,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: AppColors.activeColor, height: height * 0.0049),
              Text(
                listed.description,
                maxLines: 2,
                style: normalTextStyle.copyWith(
                  fontSize: height * 0.0228,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SongItem extends StatelessWidget {
  final Song song;
  final double height;

  const SongItem({Key? key, required this.song, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String hasChorus = '', verseCount = '';
    var verses = song.content.split("##");

    if (song.content.contains("CHORUS")) {
      hasChorus = AppConstants.hasChorus;
      verseCount = '${verses.length} Vs';
    } else {
      hasChorus = AppConstants.noChorus;
      verseCount = '${verses.length} Vs';
    }

    return Hero(
      tag: 'SongIndex_${song.id}',
      child: Card(
        elevation: 2,
        margin: EdgeInsets.only(right: 5, bottom: height * 0.0049),
        child: Padding(
          padding: EdgeInsets.all(height * 0.0049),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                songItemTitle(song.songno!, song.title),
                maxLines: 1,
                style: titleTextStyle.copyWith(
                  fontSize: height * 0.0261,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: AppColors.activeColor, height: height * 0.0049),
              Text(
                refineContent(verses[0]),
                maxLines: 2,
                style: normalTextStyle.copyWith(
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
    );
  }
}

class DraftItem extends StatelessWidget {
  final Draft draft;
  final double height;

  const DraftItem({Key? key, required this.draft, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String hasChorus = '', verseCount = '';
    var verses = draft.content.split("##");

    if (draft.content.contains("CHORUS")) {
      hasChorus = AppConstants.hasChorus;
      verseCount = '${verses.length} Vs';
    } else {
      hasChorus = AppConstants.noChorus;
      verseCount = '${verses.length} Vs';
    }

    return Hero(
      tag: 'SongIndex_${draft.id}',
      child: Card(
        elevation: 2,
        margin: EdgeInsets.only(right: 5, bottom: height * 0.0049),
        child: Padding(
          padding: EdgeInsets.all(height * 0.0049),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                songItemTitle(draft.songno!, draft.title),
                maxLines: 1,
                style: titleTextStyle.copyWith(
                  fontSize: height * 0.0261,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: AppColors.activeColor, height: height * 0.0049),
              Text(
                refineContent(verses[0]),
                maxLines: 2,
                style: normalTextStyle.copyWith(
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
    );
  }
}
