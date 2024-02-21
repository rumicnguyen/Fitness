import 'package:fitness_app/src/network/data/activity/activity_detail_reference.dart';
import 'package:fitness_app/src/network/data/activity/activity_detail_repository.dart';
import 'package:fitness_app/src/network/data/enum/date_filter.dart';
import 'package:fitness_app/src/network/model/activity/activity_detail/activity_detail.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/utils/time_data_sort.dart';

class ActivityDetailRepositoryImpl extends ActivityDetailRepository {
  final activityDetailRef = ActivityDetailReference();

  @override
  Future<MResult<MActivityDetail>> addActivityDetail({
    required MActivityDetail activityDetail,
  }) {
    return activityDetailRef.add(activityDetail);
  }

  @override
  Future<MResult<MActivityDetail>> getActivityDetail({required String id}) {
    return activityDetailRef.get(id);
  }

  @override
  Future<MResult<List<MActivityDetail>>> getActivityDetailsUser({
    required String userId,
    String activityId = '',
    required DateFilter filter,
  }) async {
    try {
      final result = await activityDetailRef.getActivityDetails();

      if (result.isError || result.data == null) {
        return MResult.error(result.error);
      }
      var list = <MActivityDetail>[];

      switch (filter) {
        case DateFilter.allTime:
        case DateFilter.toDay:
          {
            for (var element in result.data!) {
              if (element.time < 25) {
                list.add(element);
              }
            }
          }
        case DateFilter.monthly:
          {
            for (var element in result.data!) {
              if (element.time > 200) {
                list.add(element);
              }
            }
          }
        default:
          {
            for (var element in result.data!) {
              if (element.time < 108 && element.time > 100) {
                list.add(element);
              }
            }
          }
      }

      TimeDataSort.dataSort(list);
      return MResult.success(List.from(list));
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
