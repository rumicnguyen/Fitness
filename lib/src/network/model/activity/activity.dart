import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class MActivity with _$MActivity {
  const MActivity._();
  const factory MActivity({
    required String id,
    String? userId,
    DateTime? date,
    int? workoutCompeleted,
    int? hours,
    int? challengeParticipatedIn,
    int? kcal,
    double? km,
  }) = _MActivity;

  factory MActivity.empty() {
    return const MActivity(id: '');
  }

  factory MActivity.fromJson(Map<String, Object?> json) =>
      _$MActivityFromJson(json);
}
