import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/network/data/enum/date_filter.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/activity/activity_detail/activity_detail.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:fitness_app/src/utils/time_data_sort.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bar_chart_state.dart';

class BarChartBloc extends Cubit<BarChartState> {
  BarChartBloc(DateFilter? filter) : super(BarChartState.ds()) {
    syncData(filter);
  }

  DomainManager get domain => DomainManager();

  Future syncData(DateFilter? filter) async {
    final user = UserPrefs.I.getUser() ?? MUser.empty();
    if (user.id.isNotEmpty == true) {
      final result = await domain.activityDetail.getActivityDetailsUser(
        userId: user.id,
        filter: filter ?? DateFilter.toDay,
      );
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
