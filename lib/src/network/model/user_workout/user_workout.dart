import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_workout.freezed.dart';
part 'user_workout.g.dart';

/// Logic if user have done workout and renew it. Field isFinished is true and update time of startAt

@freezed
class MUserWorkout with _$MUserWorkout {
  const MUserWorkout._();
  const factory MUserWorkout({
    required String id,
    @Default('') String userId,
    @Default('') String workoutId,
    @Default('') String workoutName,
    @Default('') String userName,
    @Default('') String workoutImage,
    DateTime? startAt,
    DateTime? finishAt,
    @Default(0) int taskDone,
    @Default(0) double percentCompleted,
    @Default(false) bool isFinished,
  }) = _MUserWorkout;

  factory MUserWorkout.empty() {
    return MUserWorkout(
      id: '',
      startAt: DateTime.now(),
    );
  }

  factory MUserWorkout.fromJson(Map<String, Object?> json) =>
      _$MUserWorkoutFromJson(json);
}
