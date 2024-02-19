import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_workout.freezed.dart';
part 'user_workout.g.dart';

/// Logic if user have done workout and renew it. Field isFinished is true and update time of startAt

@freezed
class MUserWorkout with _$MUserWorkout {
  const MUserWorkout._();
  const factory MUserWorkout({
    required String id,
    String? userId,
    String? workoutId,
    String? workoutName,
    String? userName,
    String? workoutImage,
    DateTime? startAt,
    DateTime? finishAt,
    @Default(0) int taskDone,
    @Default(false) bool isFinished,
  }) = _MUserWorkout;

  factory MUserWorkout.empty() {
    return const MUserWorkout(id: '');
  }

  factory MUserWorkout.fromJson(Map<String, Object?> json) => _$MUserWorkoutFromJson(json);
}
