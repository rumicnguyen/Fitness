// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MUserChallengeImpl _$$MUserChallengeImplFromJson(Map<String, dynamic> json) =>
    _$MUserChallengeImpl(
      id: json['id'] as String,
      userId: json['userId'] as String? ?? '',
      challengeId: json['challengeId'] as String? ?? '',
      daysRunning: json['daysRunning'] as int? ?? 0,
      kilometresRun: json['kilometresRun'] as int? ?? 0,
      tasksCompleted: json['tasksCompleted'] as int? ?? 0,
      pts: json['pts'] as int? ?? 0,
      startAt: json['startAt'] == null
          ? null
          : DateTime.parse(json['startAt'] as String),
      finishAt: json['finishAt'] == null
          ? null
          : DateTime.parse(json['finishAt'] as String),
      isFineshed: json['isFineshed'] ?? false,
    );

Map<String, dynamic> _$$MUserChallengeImplToJson(
        _$MUserChallengeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'challengeId': instance.challengeId,
      'daysRunning': instance.daysRunning,
      'kilometresRun': instance.kilometresRun,
      'tasksCompleted': instance.tasksCompleted,
      'pts': instance.pts,
      'startAt': instance.startAt?.toIso8601String(),
      'finishAt': instance.finishAt?.toIso8601String(),
      'isFineshed': instance.isFineshed,
    };
