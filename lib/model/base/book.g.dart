// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['title'],
  );
  return Book(
    objectId: json['objectId'] as String?,
    enabled: json['enabled'] as bool?,
    bookNo: json['bookNo'] as int?,
    title: json['title'] as String?,
    subTitle: json['subTitle'] as String?,
    songs: json['songs'] as int?,
    position: json['position'] as int?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$BookToJson(Book instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objectId', instance.objectId);
  writeNotNull('enabled', instance.enabled);
  writeNotNull('bookNo', instance.bookNo);
  writeNotNull('title', instance.title);
  writeNotNull('subTitle', instance.subTitle);
  writeNotNull('songs', instance.songs);
  writeNotNull('position', instance.position);
  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('updatedAt', instance.updatedAt);
  writeNotNull('id', instance.id);
  return val;
}
