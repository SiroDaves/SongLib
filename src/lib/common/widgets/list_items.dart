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
            book.title!.replaceAll("''", "'"),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "${book.songs!} ${book.subtitle!} songs",
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

  const SongBook({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'BookIndex_${book.objectId}',
      child: Container(
        width: 120,
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
            '${book.title!.replaceAll("''", "'")} (${book.songs})',
            textAlign: TextAlign.center,
            style:
                normalTextStyle.copyWith(color: AppColors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class SongItem extends StatelessWidget {
  final Song song;

  const SongItem({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String hasChorus = '', verseCount = '';
    var verses = song.content!.split("\\n\\n");

    if (song.content!.contains("CHORUS")) {
      hasChorus = AppConstants.hasChorus;
      verseCount = '${verses.length} Vs';
    } else {
      hasChorus = AppConstants.noChorus;
      verseCount = '${verses.length} Vs';
    }

    return GestureDetector(
      child: Hero(
        tag: 'SongIndex_${song.objectId}',
        child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                songItemTitle(song.songno!, song.title!),
                maxLines: 1,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                refineContent(verses[0]),
                maxLines: 2,
                style: const TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 35,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    //tagView(songBook),
                    tagView(hasChorus),
                    tagView(verseCount),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {},
    );

    return Hero(
      tag: 'SongIndex_${song.objectId}',
      child: SizedBox(
        height: 50,
        child: ListTile(
          leading: const Icon(Icons.book),
          title: Text(
            '${song.songno!}. ${song.title!}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            song.alias!,
            style: const TextStyle(fontSize: 14),
          ),
          onTap: () {
            /*Get.to(
            () => TodosView(currentBook: setBook),
            transition: Transition.rightToLeft,
          );*/
          },
        ),
      ),
    );
  }

  Widget tagView(String tagText) {
    try {
      if (tagText.isNotEmpty) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.only(top: 5, left: 5),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            border: Border.all(color: AppColors.white),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: const [BoxShadow(blurRadius: 1)],
          ),
          child: Text(
            tagText,
            style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        );
      } else {
        return Container();
      }
    } on Exception {
      return Container();
    }
  }
}
