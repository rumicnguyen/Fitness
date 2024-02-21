import 'package:fitness_app/src/network/data/enum/workout_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge.freezed.dart';
part 'challenge.g.dart';

@freezed
class MChallenge with _$MChallenge {
  const MChallenge._();
  const factory MChallenge({
    required String id,
    @Default('None') String name,
    @Default('coming_soon.png') String thumbnail,
    @Default('None') String decription,
    @Default([]) List<String> workouts,
    @Default(WorkoutLevel.none) WorkoutLevel level,
    @Default(0) int members,
    @Default(true) bool isActive,
    DateTime? activeAt,
    @Default(7) double endDay,
    int? tag,
  }) = _MChallenge;

  factory MChallenge.empty() {
    return const MChallenge(id: '');
  }

  factory MChallenge.fromJson(Map<String, Object?> json) =>
      _$MChallengeFromJson(json);
}
