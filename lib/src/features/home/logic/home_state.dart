import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/model/activity/activity.dart';
import 'package:fitness_app/src/network/model/challenge/challenge.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

class HomeState extends Equatable {
  final MHandle handle;
  final MActivity todayActivity;
  final List<MWorkout> nextWorkouts;
  final MChallenge activeChallenge;
  final List<MWorkout> podcasts;
  final List<MUserWorkout> friendsActivity;
  final MUserWorkout continueWorkout;

  const HomeState({
    required this.handle,
    required this.todayActivity,
    required this.nextWorkouts,
    required this.activeChallenge,
    required this.podcasts,
    required this.friendsActivity,
    required this.continueWorkout,
  });

  factory HomeState.ds() => HomeState(
        todayActivity: MActivity.empty(),
        nextWorkouts: const [],
        activeChallenge: MChallenge.empty(),
        podcasts: const [],
        friendsActivity: const [],
        handle: MHandle(),
        continueWorkout: MUserWorkout.empty(),
      );

  HomeState copyWith({
    MHandle? handle,
    MActivity? todayActivity,
    List<MWorkout>? nextWorkouts,
    MChallenge? activeChallenge,
    List<MWorkout>? podcasts,
    List<MUserWorkout>? friendsActivity,
    MUserWorkout? continueWorkout,
  }) {
    return HomeState(
      handle: handle ?? this.handle,
      todayActivity: todayActivity ?? this.todayActivity,
      nextWorkouts: nextWorkouts ?? this.nextWorkouts,
      activeChallenge: activeChallenge ?? this.activeChallenge,
      podcasts: podcasts ?? this.podcasts,
      friendsActivity: friendsActivity ?? this.friendsActivity,
      continueWorkout: continueWorkout ?? this.continueWorkout,
    );
  }

  @override
  List<Object> get props {
    return [
      handle,
      todayActivity,
      nextWorkouts,
      activeChallenge,
      podcasts,
      friendsActivity,
      continueWorkout,
    ];
  }
}
