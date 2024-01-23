import 'package:fitness_app/src/network/data/activity/activity_detail_repository.dart';
import 'package:fitness_app/src/network/data/enum/time_data.dart';
import 'package:fitness_app/src/network/model/activity/activity_detail/activity_detail.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/utils/time_data_sort.dart';

class ActivityDetailRepositoryImpl extends ActivityDetailRepository {
  @override
  Future<MResult<MActivityDetail>> addActivityDetail(
      {required MActivityDetail activityDetail}) {
    // TODO: implement addActivityDetail
    throw UnimplementedError();
  }

  @override
  Future<MResult<MActivityDetail>> getActivityDetail({required String id}) {
    // TODO: implement getActivityDetail
    throw UnimplementedError();
  }

  @override
  Future<MResult<List<MActivityDetail>>> getActivityDetailsUser(
      {required String id, String? filter}) async {
    List<MActivityDetail> list = [
      const MActivityDetail(id: '1', time: TimeData.hour_10h, value: 10),
      const MActivityDetail(id: '2', time: TimeData.hour_12h, value: 15),
      const MActivityDetail(id: '7', time: TimeData.hour_21h, value: 25),
      const MActivityDetail(id: '4', time: TimeData.hour_11h, value: 40),
      const MActivityDetail(id: '3', time: TimeData.hour_13h, value: 30),
      const MActivityDetail(id: '6', time: TimeData.hour_15h, value: 45),
      const MActivityDetail(id: '5', time: TimeData.hour_14h, value: 60),
    ];
    TimeDataSort.dataSort(list);
    return MResult.success(List.from(list));
  }
}