// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Listed _$ListedFromJson(Map<String, dynamic> json) => Listed(
      objectId: json['objectId'] as String?,
      parentid: json['parentid'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      position: json['position'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      id: json['id'] as int?,
      song: json['song'] as int?,
    );

Map<String, dynamic> _$ListedToJson(Listed instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objectId', instance.objectId);
  writeNotNull('parentid', instance.parentid);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('position', instance.position);
  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('updatedAt', instance.updatedAt);
  writeNotNull('id', instance.id);
  writeNotNull('song', instance.song);
  return val;
}
