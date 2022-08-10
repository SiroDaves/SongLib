import 'package:songlib/database/songlib_database.dart';
import 'package:songlib/model/database/tour_results.dart';
import 'package:songlib/widget_game/data/result_data.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

part 'tour_results_dao_storage.g.dart';

@lazySingleton
abstract class TourResultsDaoStorage {
  @factoryMethod
  factory TourResultsDaoStorage(SongLibDatabase database) = _TourResultsDaoStorage;

  Future<List<ResultData>> getAllResults();

  Future<void> saveResults(List<ResultData> results);
}

@DriftAccessor(tables: [
  DbTourResultsTable,
])
class _TourResultsDaoStorage extends DatabaseAccessor<SongLibDatabase> with _$_TourResultsDaoStorageMixin implements TourResultsDaoStorage {
  _TourResultsDaoStorage(SongLibDatabase db) : super(db);

  @override
  Future<List<ResultData>> getAllResults() async => (await select(dbTourResultsTable).get()).map((result) => result.model).toList();

  @override
  Future<void> saveResults(List<ResultData> results) async {
    await delete(dbTourResultsTable).go();
    await batch((batch) => batch.insertAll(dbTourResultsTable, results.map((result) => result.dbModel)));
  }
}
