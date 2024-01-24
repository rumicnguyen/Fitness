import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/model/workout/workout.dart';

class NextWorkoutState extends Equatable {
  final List<MWorkout> workouts;
  const NextWorkoutState({
    required this.workouts,
  });

  factory NextWorkoutState.ds() => const NextWorkoutState(workouts: []);

  NextWorkoutState copyWith({
    List<MWorkout>? workouts,
  }) {
    return NextWorkoutState(
      workouts: workouts ?? this.workouts,
    );
  }

  @override
  List<Object> get props => [workouts];
}
