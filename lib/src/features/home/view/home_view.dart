import 'package:fitness_app/src/features/home/logic/next_workout_bloc.dart';
import 'package:fitness_app/src/features/home/logic/next_workout_state.dart';
import 'package:fitness_app/src/features/home/view/dashboard_view.dart';
import 'package:fitness_app/src/features/workout/widget/workout_card.dart';
import 'package:fitness_app/src/features/home/view/today_activity_view.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DashboardView(),
            _buildPlace(),
            const TodayActivityView(
              hours: 2,
              kcal: 387,
              km: 2.6,
            ),
            _buildPlace(),
            BlocProvider<NextWorkoutBloc>(
              create: (context) {
                return NextWorkoutBloc();
              },
              child: BlocBuilder<NextWorkoutBloc, NextWorkoutState>(
                buildWhen: (previous, current) {
                  return previous.workouts != current.workouts;
                },
                builder: (context, state) {
                  return WorkoutCard(
                    label: S.of(context).next_workout,
                    item: state.workouts,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlace() {
    return const SizedBox(
      height: 25.0,
    );
  }
}
