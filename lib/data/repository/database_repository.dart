import '../models/rider.dart';

abstract class DatabaseRepository {
  Future<List<Rider>> getSavedRiders();

  Future<void> saveRider(Rider rider);

  Future<void> removeRider(Rider rider);

  Future<void> removeAllRiders();
}
