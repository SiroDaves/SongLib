import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable(explicitToJson: true)
class Book {
  @JsonKey(name: 'objectId', required: true, includeIfNull: false)
  final String objectId;
  @JsonKey(name: 'bookid', required: true, includeIfNull: false)
  final int? bookid;
  @JsonKey(name: 'enabled', required: true, includeIfNull: false)
  final int? enabled;
  @JsonKey(name: 'title', required: true, includeIfNull: false)
  final String title;
  @JsonKey(name: 'subtitle', required: true, includeIfNull: false)
  final String subtitle;
  @JsonKey(name: 'songs', required: true, includeIfNull: false)
  final int? songs;
  @JsonKey(name: 'position', required: true, includeIfNull: false)
  final int? position;
  @JsonKey(name: 'createdAt', required: true, includeIfNull: false)
  final String createdAt;
  @JsonKey(name: 'updatedAt', required: true, includeIfNull: false)
  final String updatedAt;
  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;

  const Book({
    required this.objectId,
    required this.bookid,
    required this.enabled,
    required this.title,
    required this.subtitle,
    required this.songs,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    this.id,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

}
