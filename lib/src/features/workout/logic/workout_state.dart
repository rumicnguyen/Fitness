import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/network/data/enum/tab_bar_workout.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

class WorkoutState extends Equatable {
  final TabBarWorkout currentTab;
  final List<MWorkout> newSessions;
  final List<MWorkout> recommended;
  const WorkoutState({
    required this.currentTab,
    required this.newSessions,
    required this.recommended,
  });

  factory WorkoutState.ds() => const WorkoutState(
        currentTab: TabBarWorkout.forYou,
        newSessions: [],
        recommended: [],
      );

  WorkoutState copyWith({
    TabBarWorkout? currentTab,
    List<MWorkout>? newSessions,
    List<MWorkout>? recommended,
  }) {
    return WorkoutState(
      currentTab: currentTab ?? this.currentTab,
      newSessions: newSessions ?? this.newSessions,
      recommended: recommended ?? this.recommended,
    );
  }

  @override
  List<Object> get props => [currentTab, newSessions, recommended];
}
