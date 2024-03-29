import 'package:fitness_app/src/features/home/widget/block.dart';
import 'package:fitness_app/src/features/most_popular/view/most_popular_view.dart';
import 'package:fitness_app/src/features/workout/logic/workout_bloc.dart';
import 'package:fitness_app/src/features/workout/logic/workout_state.dart';
import 'package:fitness_app/src/features/workout/widget/session.dart';
import 'package:fitness_app/src/features/workout/widget/tab_bar.dart';
import 'package:fitness_app/src/features/workout/widget/workout_card.dart';
import 'package:fitness_app/src/features/workout/widget/workout_header.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/tab_bar_workout.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      child: BlocProvider<WorkoutBloc>(
        create: (BuildContext context) {
          return WorkoutBloc();
        },
        child: WorkoutHeader(
          tabBar: const XTabBar(),
          child: Column(
            children: [
              _builder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builder() {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      buildWhen: (previous, current) {
        return previous.handle != current.handle ||
            previous.currentTab != current.currentTab;
      },
      builder: (context, state) {
        switch (state.currentTab) {
          case TabBarWorkout.forYou:
            return _buildForYou(context);
          case TabBarWorkout.mostPopular:
            return const MostPopular();
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget _buildForYou(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: screenSize.height - 340,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildNewSessions(),
            _buildRecommended(),
          ],
        ),
      ),
    );
  }

  Widget _buildNewSessions() {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      buildWhen: (previous, current) {
        return previous.handle != current.handle ||
            previous.newSessions != current.newSessions;
      },
      builder: (context, state) {
        if (state.newSessions.isEmpty) {
          return _buildNewSessionsNoneData(context);
        }
        return Session(
          label: S.of(context).new_sessions,
          item: state.newSessions,
        );
      },
    );
  }

  Widget _buildRecommended() {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      buildWhen: (previous, current) {
        return previous.handle != current.handle ||
            previous.recommended != current.recommended;
      },
      builder: (context, state) {
        return WorkoutCard(
          label: S.of(context).workout_recommended,
          item: state.recommended,
          enableActions: false,
        );
      },
    );
  }

  Widget _buildNewSessionsNoneData(BuildContext context) {
    return XBlock(
      header: S.of(context).new_sessions,
      enableActions: false,
      height: 60,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: S.of(context).dont_have_any_new_sessions,
              style: AppStyles.grayTextSmallThin,
            ),
            TextSpan(
              text: S.of(context).all_workout,
              style: AppStyles.hyperLink,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AppCoordinator.showWorkoutListScreen();
                },
            ),
          ],
        ),
      ),
    );
  }
}
