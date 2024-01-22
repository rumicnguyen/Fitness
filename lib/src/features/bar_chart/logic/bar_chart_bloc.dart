import 'package:fitness_app/src/features/bar_chart/helper/time_data_sort.dart';
import 'package:fitness_app/src/features/bar_chart/logic/bar_chart_state.dart';
import 'package:fitness_app/src/features/bar_chart/logic/chart_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarChartBloc extends Cubit<BarChartState> {
  BarChartBloc() : super(BarChartState.ds());

  void renderList(List<ChartData> list) {
    List<ChartData> datas = List.from(list);
    dataSort(datas);
    emit(state.copyWith(list: datas));
  }
}
