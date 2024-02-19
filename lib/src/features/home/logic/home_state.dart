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
  final List<MChallenge> activeChallenges;
  final List<MWorkout> podcasts;
  final List<MUserWorkout> friendsActivity;

  const HomeState({
    required this.handle,
    required this.todayActivity,
    required this.nextWorkouts,
    required this.activeChallenges,
    required this.podcasts,
    required this.friendsActivity,
  });

  factory HomeState.ds() => HomeState(
        todayActivity: MActivity.empty(),
        nextWorkouts: const [],
        activeChallenges: const [],
        podcasts: const [],
        friendsActivity: const [],
        handle: MHandle(),
      );

  HomeState copyWith({
    MHandle? handle,
    MActivity? todayActivity,
    List<MWorkout>? nextWorkouts,
    List<MChallenge>? activeChallenges,
    List<MWorkout>? podcasts,
    List<MUserWorkout>? friendsActivity,
  }) {
    return HomeState(
      handle: handle ?? this.handle,
      todayActivity: todayActivity ?? this.todayActivity,
      nextWorkouts: nextWorkouts ?? this.nextWorkouts,
      activeChallenges: activeChallenges ?? this.activeChallenges,
      podcasts: podcasts ?? this.podcasts,
      friendsActivity: friendsActivity ?? this.friendsActivity,
    );
  }

  @override
  List<Object> get props {
    return [
      handle,
      todayActivity,
      nextWorkouts,
      activeChallenges,
      podcasts,
      friendsActivity,
    ];
  }
}
