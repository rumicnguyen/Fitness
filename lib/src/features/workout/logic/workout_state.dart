import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/network/data/enum/tab_bar_workout.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

class WorkoutState extends Equatable {
  final TabBarWorkout currentTab;
  final List<MWorkout> newSessions;
  final List<MWorkout> recommended;
  final List<MWorkout> mostPopular;
  const WorkoutState({
    required this.currentTab,
    required this.newSessions,
    required this.recommended,
    required this.mostPopular,
  });

  factory WorkoutState.ds() => const WorkoutState(
        currentTab: TabBarWorkout.forYou,
        newSessions: [],
        recommended: [],
        mostPopular: [],
      );

  WorkoutState copyWith({
    TabBarWorkout? currentTab,
    List<MWorkout>? newSessions,
    List<MWorkout>? recommended,
    List<MWorkout>? mostPopular,
  }) {
    return WorkoutState(
      currentTab: currentTab ?? this.currentTab,
      newSessions: newSessions ?? this.newSessions,
      recommended: recommended ?? this.recommended,
      mostPopular: mostPopular ?? this.mostPopular,
    );
  }

  @override
  List<Object> get props => [currentTab, newSessions, recommended, mostPopular];
}
