import 'package:fitness_app/src/features/home/logic/home_bloc.dart';
import 'package:fitness_app/src/features/home/logic/home_state.dart';
import 'package:fitness_app/src/features/home/view/dashboard_view.dart';
import 'package:fitness_app/src/features/home/view/friends_activity_view.dart';
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
        child: BlocProvider<HomeBloc>(
          create: (context) {
            return HomeBloc();
          },
          child: Column(
            children: [
              const DashboardView(),
              _buildPlace(),
              _buildTodayActivity(),
              _buildPlace(),
              _buildNextWorkout(),
              _buildPlace(),
              _buildPodcasts(),
              _buildPlace(),
              const FriendsActivityView(),
              _buildPlace(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlace() {
    return const SizedBox(
      height: 25.0,
    );
  }

  Widget _buildTodayActivity() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return previous.todayActivity != current.todayActivity;
      },
      builder: (context, state) {
        return TodayActivityView(
          hours: state.todayActivity.hours ?? 0,
          kcal: state.todayActivity.kcal ?? 0,
          km: state.todayActivity.km ?? 0,
        );
      },
    );
  }

  Widget _buildNextWorkout() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return previous.nextWorkouts != current.nextWorkouts;
      },
      builder: (context, state) {
        return WorkoutCard(
          label: S.of(context).next_workout,
          item: state.nextWorkouts,
        );
      },
    );
  }

  Widget _buildPodcasts() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return previous.podcasts != current.podcasts;
      },
      builder: (context, state) {
        return WorkoutCard(
          label: S.of(context).podcasts,
          item: state.podcasts,
        );
      },
    );
  }
}
