import 'package:fitness_app/src/network/data/enum/date_filter.dart';
import 'package:fitness_app/src/network/model/activity/activity.dart';
import 'package:fitness_app/src/network/model/common/result.dart';

abstract class ActivityRepository {
  Future<MResult<MActivity>> getActivityById({required String id});
  Future<MResult<List<MActivity>>> getActivitiesUser({
    required String userId,
    DateFilter? filter,
  });
  Future<MResult<MActivity>> getTodayActivityUser({required String userId});
  Future<MResult<MActivity>> addActivity({required MActivity activity});
  Future<MResult<List<MActivity>>> getActivities();
}
