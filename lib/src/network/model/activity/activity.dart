import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class MActivity with _$MActivity {
  const MActivity._();
  const factory MActivity({
    required String id,
    @Default('') String userId,
    DateTime? date,
    @Default(0) int workoutsCompleted,
    @Default(0) int hours,
    @Default(0) int challengeParticipatedIn,
    @Default(0) int kcal,
    @Default(0.0) double km,
    @Default(0) int averageHeartRate,
    @Default(0) int kilocaloriesBurned,
    @Default(0) int kilometresRun,
  }) = _MActivity;

  factory MActivity.empty() {
    return const MActivity(id: '');
  }

  factory MActivity.fromJson(Map<String, Object?> json) =>
      _$MActivityFromJson(json);
}
