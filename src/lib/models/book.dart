import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable(explicitToJson: true)
class Book {
  @JsonKey(name: 'objectId', required: true, includeIfNull: false)
  String? objectId;
  @JsonKey(name: 'bookid', required: true, includeIfNull: false)
  int? bookid;
  @JsonKey(name: 'enabled', required: true, includeIfNull: false)
  int? enabled;
  @JsonKey(name: 'title', required: true, includeIfNull: false)
  String? title;
  @JsonKey(name: 'subtitle', required: true, includeIfNull: false)
  String? subtitle;
  @JsonKey(name: 'songs', required: true, includeIfNull: false)
  int? songs;
  @JsonKey(name: 'position', required: true, includeIfNull: false)
  int? position;
  @JsonKey(name: 'createdAt', required: true, includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'updatedAt', required: true, includeIfNull: false)
  String? updatedAt;
  @JsonKey(name: 'id', includeIfNull: false)
  int? id;

   Book({
    this.objectId,
    this.bookid,
    this.enabled,
    this.title,
    this.subtitle,
    this.songs,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

}
