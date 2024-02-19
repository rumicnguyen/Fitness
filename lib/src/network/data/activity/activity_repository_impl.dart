import 'package:fitness_app/src/network/data/activity/activity_reference.dart';
import 'package:fitness_app/src/network/data/activity/activity_repository.dart';
import 'package:fitness_app/src/network/model/activity/activity.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/utils/utils.dart';

class ActivityRepositoryImpl extends ActivityRepository {
  final activityRef = ActivityReference();

  @override
  Future<MResult<MActivity>> addActivity({required MActivity activity}) {
    return activityRef.addActivity(activity);
  }

  @override
  Future<MResult<List<MActivity>>> getActivities() async {
    return activityRef.getActivitys();
  }

  @override
  Future<MResult<MActivity>> getActivityById({required String id}) {
    return activityRef.get(id);
  }

  @override
  Future<MResult<List<MActivity>>> getActivitiesUser({
    required String userId,
  }) async {
    return activityRef.getActivityByUserId(userId: userId);
  }

  @override
  Future<MResult<MActivity>> getTodayActivityUser({
    required String userId,
  }) async {
    try {
      final result = await activityRef.getActivityByUserId(userId: userId);
      if (result.isSuccess && result.data != null) {
        if (result.data!.isNotEmpty) {
          return MResult.success(
            result.data!.firstWhere(
              (element) => element.date != null && Utils.isToday(element.date!),
              orElse: () => MActivity.empty(),
            ),
          );
        }
        return MResult.success(MActivity.empty());
      }
      return MResult.error(result.error);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<List<MActivity>>> getMonthlyActivityUser({
    required String userId,
  }) async {
    try {
      final result = await activityRef.getActivityByUserId(userId: userId);
      if (result.isSuccess && result.data != null) {
        var list = <MActivity>[];
        for (var element in result.data!) {
          if (element.date != null && Utils.isInThisMonth(element.date!)) {
            list.add(element);
          }
        }
        return MResult.success(list);
      }
      return MResult.error(result.error);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<List<MActivity>>> getWeeklyActivityUser({
    required String userId,
  }) async {
    try {
      final result = await activityRef.getActivityByUserId(userId: userId);
      if (result.isSuccess && result.data != null) {
        var list = <MActivity>[];
        for (var element in result.data!) {
          if (element.date != null && Utils.isInThisWeek(element.date!)) {
            list.add(element);
          }
        }
        return MResult.success(list);
      }
      return MResult.error(result.error);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
