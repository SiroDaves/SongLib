import 'package:json_annotation/json_annotation.dart';

part 'draft.g.dart';

@JsonSerializable(explicitToJson: true)
class Draft {
  @JsonKey(name: 'objectId', required: true, includeIfNull: false)
  String? objectId;
  @JsonKey(name: 'book', required: true, includeIfNull: false)
  int? book;
  @JsonKey(name: 'songno', required: true, includeIfNull: false)
  int? songno;
  @JsonKey(name: 'title', required: true, includeIfNull: false)
  String? title;
  @JsonKey(name: 'alias', required: true, includeIfNull: false)
  String? alias;
  @JsonKey(name: 'content', required: true, includeIfNull: false)
  String? content;
  @JsonKey(name: 'key', required: true, includeIfNull: false)
  String? key;
  @JsonKey(name: 'author', required: true, includeIfNull: false)
  String? author;
  @JsonKey(name: 'views', required: true, includeIfNull: false)
  int? views;
  @JsonKey(name: 'createdAt', required: true, includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'updatedAt', required: true, includeIfNull: false)
  String? updatedAt;
  @JsonKey(name: 'liked', includeIfNull: false)
  bool? liked;
  @JsonKey(name: 'id', includeIfNull: false)
  int? id;

  Draft({
    this.objectId,
    this.book,
    this.songno,
    this.title,
    this.alias,
    this.content,
    this.key,
    this.author,
    this.views,
    this.createdAt,
    this.updatedAt,
    this.liked,
    this.id,
  });

  factory Draft.fromJson(Map<String, dynamic> json) => _$DraftFromJson(json);

  Map<String, dynamic> toJson() => _$DraftToJson(this);
}
