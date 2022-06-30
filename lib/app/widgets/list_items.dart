import 'package:flutter/material.dart';

import '../exports.dart';

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
            book.title!,
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
