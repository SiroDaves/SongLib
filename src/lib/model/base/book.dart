import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable(explicitToJson: true)
class Book {
  @JsonKey(name: 'objectId', includeIfNull: false)
  String? objectId;
  @JsonKey(name: 'enabled', includeIfNull: false)
  bool? enabled;
  @JsonKey(name: 'bookNo', includeIfNull: false)
  int? bookNo;
  @JsonKey(name: 'title', required: true, includeIfNull: false)
  String? title;
  @JsonKey(name: 'subTitle', includeIfNull: false)
  String? subTitle;
  @JsonKey(name: 'songs', includeIfNull: false)
  int? songs;
  @JsonKey(name: 'position', includeIfNull: false)
  int? position;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  String? updatedAt;
  @JsonKey(name: 'id', includeIfNull: false)
  int? id;

   Book({
    this.objectId,
    this.enabled,
    this.bookNo,
    this.title,
    this.subTitle,
    this.songs,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

}
