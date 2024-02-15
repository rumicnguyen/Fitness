import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.freezed.dart';
part 'goal.g.dart';

@freezed
class MGoal with _$MGoal {
  const MGoal._();
  const factory MGoal({
    required String id,
    @Default('') String goal,
  }) = _MGoal;

  factory MGoal.empty() {
    return const MGoal(id: '');
  }

  factory MGoal.fromJson(Map<String, Object?> json) =>
      _$MGoalFromJson(json);
}
