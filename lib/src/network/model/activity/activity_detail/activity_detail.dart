import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_detail.freezed.dart';
part 'activity_detail.g.dart';

@freezed
class MActivityDetail with _$MActivityDetail {
  const MActivityDetail._();
  const factory MActivityDetail({
    required String id,
    @Default('') String activityId,
    @Default('') String workoutId,
    @Default('') String userId,
    @Default(1) int time,
    // The number of minute in 1 hour do exercise
    @Default(0.0) double value,
  }) = _MActivityDetail;

  factory MActivityDetail.empty() {
    return const MActivityDetail(id: '');
  }

  factory MActivityDetail.fromJson(Map<String, Object?> json) =>
      _$MActivityDetailFromJson(json);
}
