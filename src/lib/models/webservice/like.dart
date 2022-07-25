import 'package:json_annotation/json_annotation.dart';

part 'like.g.dart';

@JsonSerializable(explicitToJson: true)
class Like {
  @JsonKey(name: 'objectId', required: true, includeIfNull: false)
  final String objectId;
  @JsonKey(name: 'song', required: true, includeIfNull: false)
  final int? song;
  @JsonKey(name: 'createdAt', required: true, includeIfNull: false)
  final String createdAt;
  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;

  const Like({
    required this.objectId,
    required this.song,
    required this.createdAt,
    this.id,
  });

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);

  Map<String, dynamic> toJson() => _$LikeToJson(this);

}
