import 'dart:convert';

import 'package:flutter/services.dart';

import '../../exports.dart';

class BookDummyService extends BookService {
  List<Book>? books = <Book>[];

  @override
  Future<List<Book>> getBooks() async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    if (books!.isEmpty) {
      final jsonString = await rootBundle.loadString('assets/api/books.json');
      final result = await json.decode(jsonString);

      result.forEach((book) {
        books!.add(Book.fromJson(book));
      });
    }
    return books!;
  }
}
