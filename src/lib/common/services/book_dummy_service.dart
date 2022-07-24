import 'dart:convert';

import 'package:flutter/services.dart';

import '../../exports.dart';

class BookDummyService extends BookService {
  final books = <Book>[];

  @override
  Future<List<Book>> getBooks() async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    if (books.isEmpty) {
      final jsonString = await rootBundle.loadString('assets/api');
      final result = await json.decode(jsonString) as List<Book>;
      final newBooks = result
          .map((dynamic item) => Book.fromJson(item as Map<String, dynamic>))
          .toList();
      books.addAll(newBooks);
    }
    return books;
  }
}
