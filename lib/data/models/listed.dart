import 'package:floor/floor.dart';

import '../../common/utils/constants/app_constants.dart';

@Entity(tableName: AppConstants.booksTable)
class Listed {
  @PrimaryKey(autoGenerate: true)
  int? rid;
  int? parentid;
  int? song;
  String? title;
  String? description;
  int? position;
  String? createdAt;
  String? updatedAt;

  Listed({
    this.rid,
    this.parentid,
    this.song,
    this.title,
    this.description,
    this.position,
    this.createdAt,
    this.updatedAt,
  });
}
