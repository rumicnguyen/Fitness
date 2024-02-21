// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MActivityDetailImpl _$$MActivityDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$MActivityDetailImpl(
      id: json['id'] as String,
      activityId: json['activityId'] as String? ?? '',
      workoutId: json['workoutId'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      time: json['time'] as int? ?? 1,
      value: (json['value'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$MActivityDetailImplToJson(
        _$MActivityDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activityId': instance.activityId,
      'workoutId': instance.workoutId,
      'userId': instance.userId,
      'time': instance.time,
      'value': instance.value,
    };
