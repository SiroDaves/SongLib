import 'package:floor/floor.dart';

import '../../core/utils/constants/app_constants.dart';

@Entity(tableName: AppConstants.searchesTable)
class Search {
  @PrimaryKey(autoGenerate: true)
  int? rid;
  String? title;
  String? created;

  Search({
    this.rid,
    this.title,
    this.created,
  });
}
