// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'objectId',
      'bookid',
      'enabled',
      'title',
      'subtitle',
      'songs',
      'position',
      'createdAt',
      'updatedAt'
    ],
  );
  return Book(
    objectId: json['objectId'] as String?,
    bookid: json['bookid'] as int?,
    enabled: json['enabled'] as int?,
    title: json['title'] as String?,
    subtitle: json['subtitle'] as String?,
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
  writeNotNull('bookid', instance.bookid);
  writeNotNull('enabled', instance.enabled);
  writeNotNull('title', instance.title);
  writeNotNull('subtitle', instance.subtitle);
  writeNotNull('songs', instance.songs);
  writeNotNull('position', instance.position);
  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('updatedAt', instance.updatedAt);
  writeNotNull('id', instance.id);
  return val;
}
