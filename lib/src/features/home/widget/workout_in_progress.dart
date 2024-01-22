import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/button.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WorkoutInProgress extends StatelessWidget {
  const WorkoutInProgress(
      {super.key,
      required this.persentCompleted,
      this.onPressed,
      required this.workoutName});

  final String workoutName;
  final int persentCompleted;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            AppColors.first,
            AppColors.second,
          ],
        ),
      ),
      child: XSection(
        top: 8.0,
        right: 8.0,
        bottom: 8.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBlock(
                  child: Text(
                    workoutName,
                    style: AppStyles.whiteTextMidium,
                  ),
                ),
                _buildProgressing(context),
              ],
            ),
            XButton(
              width: 120,
              height: 40,
              borderRadius: 30,
              title: S.of(context).continue_label,
              titleStyle: AppStyles.primaryColorText,
              onPressed: onPressed,
              backgroundColor: AppColors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProgressing(BuildContext context) {
    final percentValue = persentCompleted / 100.0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBlock(
          child: Text(
            persentCompleted.toString() + S.of(context).percent_completed,
            style: AppStyles.whiteTextSmall,
          ),
        ),
        const SizedBox(
          height: 3.0,
        ),
        LinearPercentIndicator(
          backgroundColor: AppColors.white,
          progressColor: AppColors.resultNumber,
          barRadius: const Radius.circular(30),
          percent: percentValue,
          leading: const SizedBox(
            width: 0,
          ),
          trailing: null,
          width: 180,
        ),
      ],
    );
  }

  Widget _buildBlock({required Widget child}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 8.0,
        ),
        child,
      ],
    );
  }
}
