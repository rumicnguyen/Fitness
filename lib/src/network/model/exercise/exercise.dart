import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

@freezed
class MExercise with _$MExercise {
  const MExercise._();
  const factory MExercise({
    required String id,
    @Default('None') String name,
    @Default(0) int sets,
    @Default(0) int minRest,
    @Default(0) int endAt,
    @Default('') String workoutId,
  }) = _MExercise;

  factory MExercise.empty() {
    return const MExercise(id: '');
  }

  factory MExercise.fromJson(Map<String, Object?> json) =>
      _$MExerciseFromJson(json);
}
