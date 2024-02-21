import 'package:fitness_app/src/network/data/enum/date_filter.dart';
import 'package:fitness_app/src/network/model/activity/activity_detail/activity_detail.dart';
import 'package:fitness_app/src/network/model/common/result.dart';

abstract class ActivityDetailRepository {
  Future<MResult<MActivityDetail>> getActivityDetail({required String id});
  Future<MResult<List<MActivityDetail>>> getActivityDetailsUser({
    required String userId,
    String activityId,
    required DateFilter filter,
  });
  Future<MResult<MActivityDetail>> addActivityDetail(
      {required MActivityDetail activityDetail});
}
