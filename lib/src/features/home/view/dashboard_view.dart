import 'package:fitness_app/src/features/home/logic/home_bloc.dart';
import 'package:fitness_app/src/features/home/logic/home_state.dart';
import 'package:fitness_app/src/features/home/widget/portal.dart';
import 'package:fitness_app/src/features/home/widget/workout_in_progress.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:fitness_app/widgets/avatar.dart';
import 'package:fitness_app/widgets/row_result.dart';
import 'package:fitness_app/widgets/title/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    MUser currentUser = UserPrefs.I.getUser() ?? MUser.empty();
    return Column(
      children: [
        _buildTitle(context, currentUser),
        _buildResult(context, currentUser),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.handle != current.handle ||
              previous.continueWorkout != current.continueWorkout,
          builder: (context, state) {
            return WorkoutInProgress(
              userWorkout: state.continueWorkout
            );
          },
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context, MUser user) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.handle != current.handle,
      builder: (context, state) {
        return XTitle(
          title: S.of(context).home_dashboard,
          actions: XPortal(
            controller: state.portalController,
            child: XAvatar(
              avatar: user.avatar,
              size: 80,
              onTap: () {
                state.portalController.toggle();
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildResult(BuildContext context, MUser user) {

    return RowResult(
      firstItem: user.workoutsCompleted.toString(),
      secondItem: user.hoursTraining.toString(),
      thirthItem: user.challengeParticipatedIn.toString(),
      firstLabel: S.of(context).workouts_completed,
      secondLabel: S.of(context).hours_spent_on_training,
      thirthLabel: S.of(context).challenge_participated_in,
    );
  }
}
