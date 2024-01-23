import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/network/data/enum/time_data.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/activity/activity_detail/activity_detail.dart';
import 'package:fitness_app/src/utils/time_data_sort.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bar_chart_state.dart';

class BarChartBloc extends Cubit<BarChartState> {
  BarChartBloc() : super(BarChartState.ds()) {
    syncData();
  }

  DomainManager get domain => DomainManager();

  Future syncData() async {
    const String id = 'userId';
    if (id.isNotEmpty == true) {
      final result = await domain.activityDetail.getActivityDetailsUser(id: id);
      if (result.isSuccess) {
        changeList(result.data);
      }
    }
  }

  void changeList(List<MActivityDetail>? list) {
    List<MActivityDetail> datas = list ??
        [
          const MActivityDetail(id: '1', time: TimeData.hour_10h, value: 10),
          const MActivityDetail(id: '2', time: TimeData.hour_2h, value: 15),
          const MActivityDetail(id: '3', time: TimeData.hour_3h, value: 30),
          const MActivityDetail(id: '4', time: TimeData.hour_1h, value: 40),
          const MActivityDetail(id: '5', time: TimeData.hour_4h, value: 60),
          const MActivityDetail(id: '6', time: TimeData.hour_5h, value: 45),
          const MActivityDetail(id: '7', time: TimeData.hour_12h, value: 25),
        ];
    TimeDataSort.dataSort(datas);
    emit(state.copyWith(list: datas));
  }
}
