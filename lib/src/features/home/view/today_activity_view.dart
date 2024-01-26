import 'package:fitness_app/src/features/bar_chart/view/bar_chart.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/title/heading.dart';
import 'package:flutter/material.dart';

class TodayActivityView extends StatelessWidget {
  const TodayActivityView({
    super.key,
    required this.hours,
    required this.kcal,
    required this.km,
  });

  final int hours;
  final int kcal;
  final double km;

  @override
  Widget build(BuildContext context) {
    return XHeading(
      header: S.of(context).today_activity,
      child: _builder(context),
    );
  }

  Widget _builder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(context),
        const SizedBox(
          height: 15,
        ),
        const XBarChart()
      ],
    );
  }

  Widget _buildLabel(BuildContext context) {
    final label =
        '$hours ${S.of(context).hours_workout} ${S.of(context).symbol_space} $kcal ${S.of(context).kcal} ${S.of(context).symbol_space} $km ${S.of(context).km}';
    return Text(
      label,
      textAlign: TextAlign.start,
      style: AppStyles.homeText,
    );
  }
}
