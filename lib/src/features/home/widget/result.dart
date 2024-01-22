import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key,
      required this.workouts,
      required this.hours,
      required this.challenges});

  final int workouts;
  final int hours;
  final int challenges;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildItem(
          number: workouts,
          label: S.of(context).workouts_completed,
        ),
        _buildLine(),
        _buildItem(
          number: hours,
          label: S.of(context).hours_spent_on_training,
        ),
        _buildLine(),
        _buildItem(
          number: challenges,
          label: S.of(context).challenge_participated_in,
        ),
      ],
    );
  }

  Widget _buildItem({required int number, required String label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          number.toString(),
          style: AppStyles.resultNumber,
          textAlign: TextAlign.center,
        ),
        Text(
          label,
          style: AppStyles.homeText,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buildLine() {
    return Container(
      width: 2,
      height: 50,
      color: AppColors.gray_300,
    );
  }
}
