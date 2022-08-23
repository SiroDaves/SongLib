import 'package:json_annotation/json_annotation.dart';

part 'listed.g.dart';

@JsonSerializable(explicitToJson: true)
class Listed {
  @JsonKey(name: 'objectId', includeIfNull: false)
  String? objectId;
  @JsonKey(name: 'parentid', includeIfNull: false)
  int? parentid;
  @JsonKey(name: 'title', includeIfNull: false)
  String? title;
  @JsonKey(name: 'description', includeIfNull: false)
  String? description;
  @JsonKey(name: 'position', includeIfNull: false)
  int? position;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  String? updatedAt;
  @JsonKey(name: 'id', includeIfNull: false)
  int? id;
  @JsonKey(name: 'song', includeIfNull: false)
  int? song;

  Listed({
    this.objectId,
    this.parentid,
    this.title,
    this.description,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.song,
  });

  factory Listed.fromJson(Map<String, dynamic> json) => _$ListedFromJson(json);

  Map<String, dynamic> toJson() => _$ListedToJson(this);
}
