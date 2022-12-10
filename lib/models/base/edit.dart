import 'package:json_annotation/json_annotation.dart';

part 'edit.g.dart';

@JsonSerializable(explicitToJson: true)
class Edit {
  @JsonKey(name: 'objectId', includeIfNull: false)
  String? objectId;
  @JsonKey(name: 'book', includeIfNull: false)
  int? book;
  @JsonKey(name: 'songNo', includeIfNull: false)
  int? songNo;
  @JsonKey(name: 'title', includeIfNull: false)
  String? title;
  @JsonKey(name: 'alias', includeIfNull: false)
  String? alias;
  @JsonKey(name: 'content', includeIfNull: false)
  String? content;
  @JsonKey(name: 'key', includeIfNull: false)
  String? key;
  @JsonKey(name: 'author', includeIfNull: false)
  String? author;
  @JsonKey(name: 'views', includeIfNull: false)
  int? views;
  @JsonKey(name: 'likes', includeIfNull: false)
  int? likes;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  String? updatedAt;
  @JsonKey(name: 'liked', includeIfNull: false)
  bool? liked;
  @JsonKey(name: 'id', includeIfNull: false)
  int? id;

  Edit({
    this.objectId,
    this.book,
    this.songNo,
    this.title,
    this.alias,
    this.content,
    this.key,
    this.author,
    this.views,
    this.likes,
    this.createdAt,
    this.updatedAt,
    this.liked,
    this.id,
  });

  factory Edit.fromJson(Map<String, dynamic> json) => _$EditFromJson(json);

  Map<String, dynamic> toJson() => _$EditToJson(this);
}
