import '../models/rider.dart';
import '../repository/database_repository.dart';
import 'app_database.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<List<Rider>> getSavedRiders() async {
    return _appDatabase.riderDao.getAllRiders();
  }

  @override
  Future<void> removeRider(Rider rider) async {
    return _appDatabase.riderDao.deleteRider(rider);
  }

  @override
  Future<void> saveRider(Rider rider) async {
    return _appDatabase.riderDao.insertRider(rider);
  }

  @override
  Future<void> removeAllRiders() async {
    return _appDatabase.riderDao.deleteAllRiders();
  }
}
