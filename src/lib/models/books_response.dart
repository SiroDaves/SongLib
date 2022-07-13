import '../exports.dart';

class BooksResponse {
  List<Book>? results;

  BooksResponse({this.results});

  BooksResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Book>[];
      json['results'].forEach((v) {
        results!.add(Book.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
