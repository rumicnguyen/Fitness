import 'package:fitness_app/src/network/data/enum/discipline_activity.dart';
import 'package:fitness_app/src/network/data/enum/workout_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
class MWorkout with _$MWorkout {
  const MWorkout._();
  const factory MWorkout({
    required String id,
    @Default('None') String name,
    @Default('None') String thumbnail,
    @Default('None') String backgroundImage,
    // minute
    int? minimumTime,
    int? maximumTime,
    @Default(0) int exercises,
    @Default(WorkoutLevel.none) WorkoutLevel level,
    @Default(0) int members,
    @Default('') String video,
    @Default(DisciplineActivity.gym) DisciplineActivity discipline,
    @Default(0) int entryFee,
    @Default(0.0) double popular,
    int? tag,
  }) = _MWorkout;

  factory MWorkout.empty() {
    return const MWorkout(id: '');
  }

  factory MWorkout.fromJson(Map<String, Object?> json) =>
      _$MWorkoutFromJson(json);
}
