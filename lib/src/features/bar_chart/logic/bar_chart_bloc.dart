import 'package:equatable/equatable.dart';
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
      if (result.isSuccess && result.data != null) {
        changeList(result.data!);
      }
    }
  }

  void changeList(List<MActivityDetail> list) {
    List<MActivityDetail> datas = List.from(list);
    TimeDataSort.dataSort(datas);
    emit(state.copyWith(list: datas));
  }
}
