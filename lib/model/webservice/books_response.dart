import 'package:json_annotation/json_annotation.dart';

import '../base/book.dart';

part 'books_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BooksResponse {
  @JsonKey(name: 'results', includeIfNull: false)
  List<Book>? results;

  BooksResponse({this.results});

  factory BooksResponse.fromJson(Map<String, dynamic> json) => _$BooksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BooksResponseToJson(this);
}
