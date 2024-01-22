import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/features/bar_chart/helper/time_data_sort.dart';
import 'package:fitness_app/src/features/bar_chart/logic/chart_data.dart';
import 'package:fitness_app/src/features/bar_chart/logic/time_data.dart';

class BarChartState extends Equatable {
  final List<ChartData> list;
  const BarChartState({
    required this.list,
  });

  factory BarChartState.ds() {
    List<ChartData> list = [
      ChartData(time: TimeData.hour_10h, value: 10),
      ChartData(time: TimeData.hour_12h, value: 13),
      ChartData(time: TimeData.hour_13h, value: 5),
      ChartData(time: TimeData.hour_11h, value: 1),
      ChartData(time: TimeData.hour_14h, value: 8),
      ChartData(time: TimeData.hour_15h, value: 17),
      ChartData(time: TimeData.hour_21h, value: 7),
    ];
    dataSort(list);
    return BarChartState(
      list: list,
    );
  }
  BarChartState copyWith({
    List<ChartData>? list,
  }) {
    return BarChartState(
      list: list ?? this.list,
    );
  }

  @override
  List<Object> get props => [list];
}
