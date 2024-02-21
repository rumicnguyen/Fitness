import 'package:fitness_app/src/features/bar_chart/logic/bar_chart_bloc.dart';
import 'package:fitness_app/src/network/data/enum/date_filter.dart';
import 'package:fitness_app/src/network/data/enum/time_data.dart';
import 'package:fitness_app/src/network/model/activity/activity_detail/activity_detail.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class XBarChart extends StatelessWidget {
  const XBarChart({
    Key? key,
    this.filter,
  }) : super(key: key);

  final DateFilter? filter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BarChartBloc>(
      create: (context) {
        return BarChartBloc(filter);
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.backgroundBarChart,
          ),
          child: BlocBuilder<BarChartBloc, BarChartState>(
            buildWhen: (previous, current) {
              return previous.list != current.list;
            },
            builder: (context, state) {
              if (state.list.isEmpty) return const SizedBox();
              return _buildChart(state.list);
            },
          )),
    );
  }

  Widget _buildChart(List<MActivityDetail> list) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      borderWidth: 0,
      backgroundColor: AppColors.transparent,
      primaryXAxis: const CategoryAxis(
        maximumLabels: 24,
        axisLine: AxisLine(width: 0),
        labelStyle: AppStyles.blackTextSmall,
        majorTickLines: MajorTickLines(width: 0),
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: const NumericAxis(
        minimum: 0,
        maximum: 60,
        interval: 18,
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(width: 0),
        majorGridLines: MajorGridLines(
          width: 1,
          color: AppColors.gray,
        ),
        labelStyle: TextStyle(fontSize: 0),
      ),
      series: <CartesianSeries<MActivityDetail, String>>[
        ColumnSeries<MActivityDetail, String>(
          dataSource: list,
          xValueMapper: (MActivityDetail data, _) {
            return TimeData.fromValue(data.time).label;
          },
          yValueMapper: (MActivityDetail data, _) {
            return data.value;
          },
          pointColorMapper: (MActivityDetail data, _) {
            int index = list.indexOf(data) + 1;
            if (index % 2 == 0) {
              return AppColors.second;
            } else {
              if (index % 3 == 0) {
                return AppColors.thirth;
              } else {
                return AppColors.first;
              }
            }
          },
          opacity: 0.7,
          width: 1,
        ),
      ],
    );
  }
}
