// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Like _$LikeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['objectId', 'song', 'createdAt'],
  );
  return Like(
    objectId: json['objectId'] as String,
    song: json['song'] as int?,
    createdAt: json['createdAt'] as String,
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$LikeToJson(Like instance) {
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
