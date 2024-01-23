// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MActivityImpl _$$MActivityImplFromJson(Map<String, dynamic> json) =>
    _$MActivityImpl(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      workoutCompeleted: json['workoutCompeleted'] as int?,
      hours: json['hours'] as int?,
      challengeParticipatedIn: json['challengeParticipatedIn'] as int?,
      kcal: json['kcal'] as int?,
      km: (json['km'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MActivityImplToJson(_$MActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date?.toIso8601String(),
      'workoutCompeleted': instance.workoutCompeleted,
      'hours': instance.hours,
      'challengeParticipatedIn': instance.challengeParticipatedIn,
      'kcal': instance.kcal,
      'km': instance.km,
    };
