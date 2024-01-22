import 'package:fitness_app/gen/assets.gen.dart';
import 'package:fitness_app/src/features/home/widget/result.dart';
import 'package:fitness_app/src/features/home/widget/workout_in_progress.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/widgets/avatar.dart';
import 'package:fitness_app/widgets/title.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(context),
        const Result(
          workouts: 17,
          hours: 245,
          challenges: 7,
        ),
        const SizedBox(
          height: 20,
        ),
        WorkoutInProgress(
          persentCompleted: 75,
          workoutName: S.of(context).waist_cinching_workout,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return XTitle(
      title: S.of(context).home_dashboard,
      actions: XAvatar(
        avatar: Assets.images.avatar.path,
        size: 80,
      ),
    );
  }
}
