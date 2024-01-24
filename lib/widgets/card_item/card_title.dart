import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/workout_level.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class XCartTitle extends StatelessWidget {
  const XCartTitle({
    super.key,
    required this.title,
    required this.members,
    required this.level,
  });

  final String title;
  final int members;
  final WorkoutLevel level;

  @override
  Widget build(BuildContext context) {
    final String description =
        '$members ${S.of(context).members} ${S.of(context).symbol_space} ${level.value} ${S.of(context).level}';
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.whiteTextSmallB,
        ),
        Text(
          description,
          style: AppStyles.whiteTextMidium,
        )
      ],
    );
  }
}
