import 'package:fitness_app/src/features/bar_chart/logic/bar_chart_bloc.dart';
import 'package:fitness_app/src/features/bar_chart/logic/bar_chart_state.dart';
import 'package:fitness_app/src/features/bar_chart/logic/chart_data.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class XBarChart extends StatelessWidget {
  const XBarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BarChartBloc>(
      create: (context) {
        return BarChartBloc();
      },
      child: BlocBuilder<BarChartBloc, BarChartState>(
        buildWhen: (previous, current) {
          return previous.list != current.list;
        },
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.backgroundBarChart,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: _buildChart(),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      width: double.infinity,
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildLine(),
                          _buildLine(),
                          _buildLine(),
                        ],
                      ),
                    )
                  ],
                ),
                _buildBottomLabel(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildChart() {
    return BlocBuilder<BarChartBloc, BarChartState>(
      builder: (context, state) {
        return SfCartesianChart(
          plotAreaBorderWidth: 0,
          borderWidth: 0,
          backgroundColor: AppColors.transparent,
          primaryXAxis: const CategoryAxis(
            maximumLabels: 8,
            isVisible: false,
          ),
          primaryYAxis: const NumericAxis(
            isVisible: false,
          ),
          series: <CartesianSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
              dataSource: state.list,
              xValueMapper: (ChartData data, _) => data.time.label,
              yValueMapper: (ChartData data, _) => data.value,
              pointColorMapper: (ChartData data, _) {
                int index = state.list.indexOf(data) + 1;
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
              width: 1,
            ),
          ],
        );
      },
    );
  }

  Widget _buildBottomLabel() {
    return BlocBuilder<BarChartBloc, BarChartState>(
      builder: (context, state) {
        return XSection(
          horizontal: 7.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: state.list
                .map(
                  (e) => Text(
                    e.time.label,
                    style: AppStyles.blackTextSmall,
                    textAlign: TextAlign.center,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildLine() {
    return Column(
      children: [
        const SizedBox(
          height: 55,
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.gray,
        ),
      ],
    );
  }
}
