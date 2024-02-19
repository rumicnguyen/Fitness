// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MActivityImpl _$$MActivityImplFromJson(Map<String, dynamic> json) =>
    _$MActivityImpl(
      id: json['id'] as String,
      userId: json['userId'] as String? ?? '',
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      workoutsCompleted: json['workoutsCompleted'] as int? ?? 0,
      hours: json['hours'] as int? ?? 0,
      challengeParticipatedIn: json['challengeParticipatedIn'] as int? ?? 0,
      kcal: json['kcal'] as int? ?? 0,
      km: (json['km'] as num?)?.toDouble() ?? 0.0,
      averageHeartRate: json['averageHeartRate'] as int? ?? 0,
      kilocaloriesBurned: json['kilocaloriesBurned'] as int? ?? 0,
      kilometresRun: json['kilometresRun'] as int? ?? 0,
    );

Map<String, dynamic> _$$MActivityImplToJson(_$MActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date?.toIso8601String(),
      'workoutsCompleted': instance.workoutsCompleted,
      'hours': instance.hours,
      'challengeParticipatedIn': instance.challengeParticipatedIn,
      'kcal': instance.kcal,
      'km': instance.km,
      'averageHeartRate': instance.averageHeartRate,
      'kilocaloriesBurned': instance.kilocaloriesBurned,
      'kilometresRun': instance.kilometresRun,
    };
