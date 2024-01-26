import 'package:fitness_app/src/network/data/activity/activity_repository.dart';
import 'package:fitness_app/src/network/data/enum/date_filter.dart';
import 'package:fitness_app/src/network/model/activity/activity.dart';
import 'package:fitness_app/src/network/model/common/result.dart';

class ActivityRepositoryImpl extends ActivityRepository {
  @override
  Future<MResult<MActivity>> addActivity({required MActivity activity}) {
    // TODO: implement addActivity
    throw UnimplementedError();
  }

  @override
  Future<MResult<List<MActivity>>> getActivities() async {
    try {
      List<MActivity> list = [
        MActivity(
          id: '1',
          userId: '1',
          workoutCompeleted: 2,
          challengeParticipatedIn: 1,
          hours: 3,
          kcal: 400,
          km: 3.1,
          date: DateTime.now(),
        ),
        MActivity(
          id: '2',
          userId: '2',
          workoutCompeleted: 2,
          challengeParticipatedIn: 1,
          hours: 3,
          kcal: 400,
          km: 3.1,
          date: DateTime.now(),
        ),
        MActivity(
          id: '3',
          userId: '2',
          workoutCompeleted: 2,
          challengeParticipatedIn: 1,
          hours: 3,
          kcal: 400,
          km: 3.1,
          date: DateTime(2023, DateTime.january, DateTime.monday),
        ),
        MActivity(
          id: '4',
          userId: '1',
          workoutCompeleted: 2,
          challengeParticipatedIn: 1,
          hours: 3,
          kcal: 400,
          km: 3.1,
          date: DateTime(2023, DateTime.january, DateTime.thursday),
        ),
        MActivity(
          id: '5',
          userId: '1',
          workoutCompeleted: 2,
          challengeParticipatedIn: 1,
          hours: 3,
          kcal: 400,
          km: 3.1,
          date: DateTime.now(),
        ),
      ];

      // check when fetch data
      // if (list == null) {
      //   return MResult.error('error');
      // }
      return MResult.success(list);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<MActivity>> getActivityById({required String id}) {
    // TODO: implement getActivityById
    throw UnimplementedError();
  }

  @override
  Future<MResult<List<MActivity>>> getActivitiesUser({
    required String userId,
    DateFilter? filter,
  }) async {
    try {
      MResult<List<MActivity>> list = await getActivities();
      List<MActivity> data = [];

      if (list.isError || list.data == null) {
        return MResult.error('error');
      }

      switch (filter) {
        case DateFilter.allTime:
          for (var element in list.data!) {
            if (element.userId == userId) {
              data.add(element);
            }
          }
        // develop later
        case DateFilter.weekly:
        // develop later
        case DateFilter.monthly:
        default:
          for (var element in list.data!) {
            if (element.userId == userId) {
              data.add(element);
            }
          }
      }

      return MResult.success(data);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<MActivity>> getTodayActivityUser(
      {required String userId}) async {
    try {
      MResult<List<MActivity>> list = await getActivities();
      if (list.isError || list.data == null) {
        return MResult.error('error');
      }

      for (var element in list.data!) {
        if (element.date?.day == DateTime.now().day) {
          return MResult.success(element);
        }
      }
      return MResult.success(MActivity.empty());
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
