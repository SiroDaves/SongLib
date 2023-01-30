import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../util/constants/utilities.dart';
import '../../widget/general/list_items.dart';

class Book {
  int? id;
  String? objectId;
  String? title;
  String? subTitle;
  int? songs;
  int? position;
  int? bookNo;
  bool? enabled;
  String? createdAt;
  String? updatedAt;

  Book({
    this.id,
    this.objectId,
    this.title,
    this.subTitle,
    this.songs,
    this.position,
    this.bookNo,
    this.enabled,
    this.createdAt,
    this.updatedAt,
  });

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['objectId'];
    title = json['title'];
    subTitle = json['subTitle'];
    songs = json['songs'];
    position = json['position'];
    bookNo = json['bookNo'];
    enabled = json['enabled'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['objectId'] = objectId;
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['songs'] = songs;
    data['position'] = position;
    data['bookNo'] = bookNo;
    data['enabled'] = enabled;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  List<Book> fromData(List<ParseObject?> data) {
    return data
        .map(
          (object) => Book(
            objectId: object!.get<String>('objectId'),
            id: object.get<int>('id'),
            bookNo: object.get<int>('bookNo'),
            title: object.get<String>('title'),
            subTitle: object.get<String>('subTitle'),
            position: object.get<int>('position'),
            songs: object.get<int>('songs'),
            enabled: object.get<bool>('enabled'),
            createdAt: dateToString(object.get<DateTime>('createdAt')!),
            updatedAt: dateToString(object.get<DateTime>('updatedAt')!),
          ),
        )
        .toList();
  }

}
