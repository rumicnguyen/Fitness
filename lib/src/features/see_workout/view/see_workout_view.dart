import 'package:fitness_app/src/features/see_workout/logic/see_workout_bloc.dart';
import 'package:fitness_app/src/features/see_workout/logic/see_workout_state.dart';
import 'package:fitness_app/src/features/see_workout/widget/view_item.dart';
import 'package:fitness_app/src/network/model/filter_workout/filter_workout.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/widgets/loading.dart';
import 'package:fitness_app/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeWorkoutView extends StatelessWidget {
  const SeeWorkoutView({
    super.key,
    this.filterWorkout,
  });

  final MFilterWorkout? filterWorkout;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SeeWorkoutBloc>(
      create: (context) => SeeWorkoutBloc(filterWorkout),
      child: BlocConsumer<SeeWorkoutBloc, SeeWorkoutState>(
        listenWhen: (previous, current) => previous.handle != current.handle,
        listener: (context, state) {
          // TODO: implement listener
        },
        buildWhen: (previous, current) =>
            previous.handle != current.handle ||
            previous.workouts != current.workouts,
        builder: (context, state) {
          return XScaffold(
            enableAppbar: true,
            iconColor: AppColors.gray,
            child: state.handle.isLoading ? const Loading() : _body(),
          );
        },
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<SeeWorkoutBloc, SeeWorkoutState>(
      buildWhen: (previous, current) => previous.workouts != current.workouts,
      builder: (context, state) {
        return state.workouts.isNotEmpty
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.workouts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ViewItem(item: state.workouts[index]);
                },
              )
            : const Center(
                child: Text('List is empty'),
              );
      },
    );
  }
}
