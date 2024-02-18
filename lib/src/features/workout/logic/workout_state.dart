import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/data/enum/tab_bar_workout.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

class WorkoutState extends Equatable {
  final MHandle handle;
  final TabBarWorkout currentTab;
  final List<MWorkout> newSessions;
  final List<MWorkout> recommended;
  final MUserWorkout continueWorkout;
  const WorkoutState({
    required this.handle,
    required this.currentTab,
    required this.newSessions,
    required this.recommended,
    required this.continueWorkout,
  });

  factory WorkoutState.ds() => WorkoutState(
        currentTab: TabBarWorkout.forYou,
        newSessions: const [],
        recommended: const [],
        handle: MHandle(),
        continueWorkout: MUserWorkout.empty(),
      );

  WorkoutState copyWith({
    MHandle? handle,
    TabBarWorkout? currentTab,
    List<MWorkout>? newSessions,
    List<MWorkout>? recommended,
    MUserWorkout? continueWorkout,
  }) {
    return WorkoutState(
      handle: handle ?? this.handle,
      currentTab: currentTab ?? this.currentTab,
      newSessions: newSessions ?? this.newSessions,
      recommended: recommended ?? this.recommended,
      continueWorkout: continueWorkout ?? this.continueWorkout,
    );
  }

  @override
  List<Object> get props {
    return [
      handle,
      currentTab,
      newSessions,
      recommended,
      continueWorkout,
    ];
  }
}
