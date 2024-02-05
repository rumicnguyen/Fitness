import 'package:equatable/equatable.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/exercise/exercise.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

class StartWorkoutState extends Equatable {
  final MHandle handle;
  final MWorkout workout;
  final List<MExercise> exercise;
  final int countTaskDone;
  final YoutubePlayerController controller;
  final int current;
  const StartWorkoutState({
    required this.handle,
    required this.workout,
    required this.exercise,
    required this.countTaskDone,
    required this.controller,
    required this.current,
  });

  factory StartWorkoutState.ds() => StartWorkoutState(
        handle: MHandle(),
        workout: MWorkout.empty(),
        exercise: const [],
        countTaskDone: 0,
        controller: YoutubePlayerController(initialVideoId: ''),
        current: 0,
      );

  StartWorkoutState copyWith({
    MHandle? handle,
    MWorkout? workout,
    List<MExercise>? exercise,
    int? countTaskDone,
    YoutubePlayerController? controller,
    int? current,
  }) {
    return StartWorkoutState(
      handle: handle ?? this.handle,
      workout: workout ?? this.workout,
      exercise: exercise ?? this.exercise,
      countTaskDone: countTaskDone ?? this.countTaskDone,
      controller: controller ?? this.controller,
      current: current ?? this.current,
    );
  }

  @override
  List<Object> get props {
    return [
      handle,
      workout,
      exercise,
      countTaskDone,
      controller,
      current,
    ];
  }
}
