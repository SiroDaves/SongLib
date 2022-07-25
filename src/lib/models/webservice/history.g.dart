// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['objectId', 'song', 'createdAt'],
  );
  return History(
    objectId: json['objectId'] as String,
    song: json['song'] as int?,
    createdAt: json['createdAt'] as String,
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$HistoryToJson(History instance) {
  final val = <String, dynamic>{
    'objectId': instance.objectId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('song', instance.song);
  val['createdAt'] = instance.createdAt;
  writeNotNull('id', instance.id);
  return val;
}
