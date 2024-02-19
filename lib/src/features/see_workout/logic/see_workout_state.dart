import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

class SeeWorkoutState extends Equatable {
  final List<MWorkout> workouts;
  final MHandle handle;
  const SeeWorkoutState({
    required this.workouts,
    required this.handle,
  });

  factory SeeWorkoutState.ds() => SeeWorkoutState(
        workouts: const [],
        handle: MHandle(),
      );

  SeeWorkoutState copyWith({
    List<MWorkout>? workouts,
    MHandle? handle,
  }) {
    return SeeWorkoutState(
      workouts: workouts ?? this.workouts,
      handle: handle ?? this.handle,
    );
  }

  @override
  List<Object> get props => [workouts, handle];
}
