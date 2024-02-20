import 'package:fitness_app/src/features/home/widget/workout_in_progress.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/widgets/title/title.dart';
import 'package:flutter/material.dart';

class WorkoutHeader extends StatelessWidget {
  const WorkoutHeader({
    super.key,
    required this.child,
    required this.tabBar,
  });

  final Widget child;
  final Widget tabBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSpace(),
        XTitle(
          height: 100,
          title: S.of(context).workouts,
          actions: IconButton(
            onPressed: () {
              AppCoordinator.showFilterWorkoutScreen();
            },
            icon: const Icon(Icons.search),
          ),
        ),
        WorkoutInProgress(
          userWorkout: MUserWorkout.empty(),
        ),
        _buildSpace(),
        tabBar,
        _buildSpace(),
        child
      ],
    );
  }

  Widget _buildSpace() {
    return const SizedBox(
      height: 20,
    );
  }
}
