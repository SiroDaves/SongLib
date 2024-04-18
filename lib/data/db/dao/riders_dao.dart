import 'package:floor/floor.dart';

import '../../../common/utils/constants/app_constants.dart';
import '../../models/rider.dart';

@dao
abstract class RidersDao {
  @Query('SELECT * FROM riders WHERE rid = :rid')
  Future<Rider?> findRiderById(int rid);

  @Query('SELECT * FROM ${AppConstants.ridersTable}')
  Future<List<Rider>> getAllRiders();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertRider(Rider rider);

  @update
  Future<void> updateRider(Rider rider);

  @delete
  Future<void> deleteRider(Rider rider);

  @Query("DELETE FROM ${AppConstants.ridersTable}")
  Future<void> deleteAllRiders();
}
