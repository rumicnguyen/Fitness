import 'package:fitness_app/src/network/model/activity/activity_detail/activity_detail.dart';
import 'package:fitness_app/src/network/model/common/result.dart';

abstract class ActivityDetailRepository{
  Future<MResult<MActivityDetail>> getActivityDetail({required String id});
  Future<MResult<List<MActivityDetail>>> getActivityDetailsUser({required String id, String? filter});
  Future<MResult<MActivityDetail>> addActivityDetail({required MActivityDetail activityDetail});
}