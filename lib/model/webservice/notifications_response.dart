import 'package:json_annotation/json_annotation.dart';

import '../general/notification.dart';

part 'notifications_response.g.dart';

@JsonSerializable(explicitToJson: true)
class NotificationsResponse {
  @JsonKey(name: 'results', includeIfNull: false)
  List<Notification>? results;

  NotificationsResponse({this.results});

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) => _$NotificationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsResponseToJson(this);
}