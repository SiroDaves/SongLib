import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable(explicitToJson: true)
class Notification {
  @JsonKey(name: 'objectId', includeIfNull: false)
  String? objectId;
  @JsonKey(name: 'title', includeIfNull: false)
  String? title;
  @JsonKey(name: 'content', includeIfNull: false)
  String? content;
  @JsonKey(name: 'image', includeIfNull: false)
  String? image;
  @JsonKey(name: 'views', includeIfNull: false)
  int? views;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  String? updatedAt;

  Notification({
    this.objectId,
    this.title,
    this.content,
    this.image,
    this.views,
    this.createdAt,
    this.updatedAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
