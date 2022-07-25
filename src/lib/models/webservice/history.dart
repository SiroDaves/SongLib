import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable(explicitToJson: true)
class History {
  @JsonKey(name: 'objectId', required: true, includeIfNull: false)
  final String objectId;
  @JsonKey(name: 'song', required: true, includeIfNull: false)
  final int? song;
  @JsonKey(name: 'createdAt', required: true, includeIfNull: false)
  final String createdAt;
  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;

  const History({
    required this.objectId,
    required this.song,
    required this.createdAt,
    this.id,
  });

  factory History.fromJson(Map<String, dynamic> json) => _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);

}
