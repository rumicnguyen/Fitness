import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_workout.freezed.dart';
part 'user_workout.g.dart';

@freezed
class MUserWorkout with _$MUserWorkout {
  const MUserWorkout._();
  const factory MUserWorkout({
    required String id,
    String? idUser,
    String? idWorkout,
    String? workoutName,
    String? userName,
    String? workoutImage,
    DateTime? startAt,
    DateTime? finishAt,
  }) = _MUserWorkout;

  factory MUserWorkout.empty() {
    return const MUserWorkout(id: '');
  }

  factory MUserWorkout.fromJson(Map<String, Object?> json) => _$MUserWorkoutFromJson(json);
}
