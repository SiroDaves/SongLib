// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      bookId: (json['bookId'] as num?)?.toInt(),
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      songs: (json['songs'] as num?)?.toInt(),
      position: (json['position'] as num?)?.toInt(),
      bookNo: (json['bookNo'] as num?)?.toInt(),
      enabled: json['enabled'] as bool?,
      created: json['created'] as String?,
      updated: json['updated'] as String?,
    )..rid = (json['rid'] as num?)?.toInt();

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'rid': instance.rid,
      'bookId': instance.bookId,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'songs': instance.songs,
      'position': instance.position,
      'bookNo': instance.bookNo,
      'enabled': instance.enabled,
      'created': instance.created,
      'updated': instance.updated,
    };
