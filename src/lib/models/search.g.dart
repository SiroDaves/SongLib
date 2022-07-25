// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search _$SearchFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['objectId', 'title', 'createdAt'],
  );
  return Search(
    objectId: json['objectId'] as String,
    title: json['title'] as String,
    createdAt: json['createdAt'] as String,
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$SearchToJson(Search instance) {
  final val = <String, dynamic>{
    'objectId': instance.objectId,
    'title': instance.title,
    'createdAt': instance.createdAt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}
