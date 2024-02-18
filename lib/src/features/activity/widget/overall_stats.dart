import 'package:fitness_app/src/features/activity/logic/activity_bloc.dart';
import 'package:fitness_app/src/features/activity/logic/activity_state.dart';
import 'package:fitness_app/src/features/challenge/widget/stats.dart';
import 'package:fitness_app/src/features/home/widget/block.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/stats_type.dart';
import 'package:fitness_app/widgets/row_result.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverallStats extends StatelessWidget {
  const OverallStats({super.key});

  @override
  Widget build(BuildContext context) {
    return XBlock(
      header: S.of(context).overall_stats,
      enableActions: false,
      height: 310,
      child: Column(
        children: [
          _buildResult(),
          const SizedBox(
            height: 20,
          ),
          _buildStats(),
        ],
      ),
    );
  }

  Widget _buildResult() {
    return BlocBuilder<ActivityBloc, ActivityState>(
      buildWhen: (previous, current) =>
          previous.handle != current.handle ||
          previous.workoutsCompleted != current.workoutsCompleted ||
          previous.hoursTraining != current.hoursTraining ||
          previous.challengeParticipatedIn != current.challengeParticipatedIn,
      builder: (context, state) {
        return RowResult(
          firstItem: state.workoutsCompleted.toString(),
          secondItem: state.hoursTraining.toString(),
          thirthItem: state.challengeParticipatedIn.toString(),
          firstLabel: S.of(context).workouts_completed,
          secondLabel: S.of(context).hours_spent_on_training,
          thirthLabel: S.of(context).challenge_participated_in,
        );
      },
    );
  }

  Widget _buildStats() {
    return BlocBuilder<ActivityBloc, ActivityState>(
      buildWhen: (previous, current) =>
          previous.handle != current.handle ||
          previous.averageHeartRate != current.averageHeartRate ||
          previous.kilometresRun != current.kilometresRun ||
          previous.kilocaloriesBurned != current.kilocaloriesBurned ||
          previous.startAt != current.startAt,
      builder: (context, state) {
        return Column(
          children: [
            Stats(
              time: state.startAt,
              value: state.averageHeartRate,
              type: StatsType.averageHeartRate,
            ),
            const SizedBox(
              height: 10,
            ),
            Stats(
              time: state.startAt,
              value: state.kilometresRun,
              type: StatsType.kilometresRun,
            ),
            const SizedBox(
              height: 10,
            ),
            Stats(
              time: state.startAt,
              value: state.kilocaloriesBurned,
              type: StatsType.kilocaloriesBurned,
            ),
          ],
        );
      },
    );
  }
}
