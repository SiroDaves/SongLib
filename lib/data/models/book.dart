import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../common/utils/constants/app_constants.dart';

part 'book.g.dart';

@Entity(tableName: AppConstants.booksTable)
@JsonSerializable()

class Book {
  @PrimaryKey(autoGenerate: true)
  int? rid;
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

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}

