import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/model/challenge/challenge.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

class ChallengeDetailState extends Equatable {
  final List<MWorkout> workouts;
  final MHandle handle;
  final MChallenge challenge;
  const ChallengeDetailState({
    required this.workouts,
    required this.handle,
    required this.challenge,
  });

  factory ChallengeDetailState.ds() => ChallengeDetailState(
        workouts: const [],
        handle: MHandle(),
        challenge: MChallenge.empty(),
      );

  ChallengeDetailState copyWith({
    List<MWorkout>? workouts,
    MHandle? handle,
    MChallenge? challenge,
  }) {
    return ChallengeDetailState(
      workouts: workouts ?? this.workouts,
      handle: handle ?? this.handle,
      challenge: challenge ?? this.challenge,
    );
  }

  @override
  List<Object> get props => [workouts, handle, challenge];
}
