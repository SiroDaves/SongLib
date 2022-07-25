import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';

@JsonSerializable(explicitToJson: true)
class Song {
  @JsonKey(name: 'objectId', required: true, includeIfNull: false)
  final String objectId;
  @JsonKey(name: 'book', required: true, includeIfNull: false)
  final int? book;
  @JsonKey(name: 'songno', required: true, includeIfNull: false)
  final int? songno;
  @JsonKey(name: 'title', required: true, includeIfNull: false)
  final String title;
  @JsonKey(name: 'alias', required: true, includeIfNull: false)
  final String alias;
  @JsonKey(name: 'content', required: true, includeIfNull: false)
  final String content;
  @JsonKey(name: 'key', required: true, includeIfNull: false)
  final String key;
  @JsonKey(name: 'author', required: true, includeIfNull: false)
  final String author;
  @JsonKey(name: 'views', required: true, includeIfNull: false)
  final int? views;
  @JsonKey(name: 'createdAt', required: true, includeIfNull: false)
  final String createdAt;
  @JsonKey(name: 'updatedAt', required: true, includeIfNull: false)
  final String updatedAt;
  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;

  const Song({
    required this.objectId,
    required this.book,
    required this.songno,
    required this.title,
    required this.alias,
    required this.content,
    required this.key,
    required this.author,
    required this.views,
    required this.createdAt,
    required this.updatedAt,
    this.id,
  });

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);
}
