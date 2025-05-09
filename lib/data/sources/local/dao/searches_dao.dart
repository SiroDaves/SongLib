import 'package:floor/floor.dart';

import '../../../../core/utils/constants/app_constants.dart';
import '../../../models/search.dart';

@dao
abstract class SearchesDao {
  @Query('SELECT * FROM ${AppConstants.searchesTable}')
  Future<List<Search>> fetchSearches();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertSearch(Search search);

  @delete
  Future<void> deleteSearch(Search search);

  @Query("DELETE FROM ${AppConstants.searchesTable}")
  Future<void> deleteAllSearches();
}
