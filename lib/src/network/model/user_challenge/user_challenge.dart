import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_challenge.freezed.dart';
part 'user_challenge.g.dart';

@freezed
class MUserChallenge with _$MUserChallenge {
  const MUserChallenge._();
  const factory MUserChallenge({
    required String id,
    @Default('') String userId,
    @Default('') String challengeId,
    @Default(0) int daysRunning,
    @Default(0) int kilometresRun,
    @Default(0) int tasksCompleted,
    @Default(0) int pts,
    DateTime? startAt,
    DateTime? finishAt,
    @Default(false) isFinished,
  }) = _MUserChallenge;

  factory MUserChallenge.empty() {
    return const MUserChallenge(id: '');
  }

  factory MUserChallenge.fromJson(Map<String, Object?> json) =>
      _$MUserChallengeFromJson(json);
}
