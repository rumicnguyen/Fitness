part of 'bar_chart_bloc.dart';

class BarChartState extends Equatable {
  final List<MActivityDetail> list;
  const BarChartState({
    required this.list,
  });

  factory BarChartState.ds() {
    return const BarChartState(list: []);
  }

  BarChartState copyWith({
    List<MActivityDetail>? list,
  }) {
    return BarChartState(
      list: list ?? this.list,
    );
  }

  @override
  List<Object> get props => [list];
}
