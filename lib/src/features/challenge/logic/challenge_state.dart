import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/model/challenge/challenge.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/user_challenge/user_challenge.dart';

class ChallengeState extends Equatable {
  final MHandle handle;
  final MUserChallenge userChallenge;
  final MChallenge challenge;
  const ChallengeState({
    required this.handle,
    required this.userChallenge,
    required this.challenge,
  });

  factory ChallengeState.ds() => ChallengeState(
        handle: MHandle(),
        challenge: MChallenge.empty(),
        userChallenge: MUserChallenge.empty(),
      );

  ChallengeState copyWith({
    MHandle? handle,
    MUserChallenge? userChallenge,
    MChallenge? challenge,
  }) {
    return ChallengeState(
      handle: handle ?? this.handle,
      userChallenge: userChallenge ?? this.userChallenge,
      challenge: challenge ?? this.challenge,
    );
  }

  @override
  List<Object> get props => [handle, userChallenge, challenge];
}
