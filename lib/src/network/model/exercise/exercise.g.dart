// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MExerciseImpl _$$MExerciseImplFromJson(Map<String, dynamic> json) =>
    _$MExerciseImpl(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'None',
      sets: json['sets'] as int? ?? 0,
      minRest: json['minRest'] as int? ?? 0,
      endAt: json['endAt'] as int? ?? 0,
      workoutId: json['workoutId'] as String? ?? '',
    );

Map<String, dynamic> _$$MExerciseImplToJson(_$MExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sets': instance.sets,
      'minRest': instance.minRest,
      'endAt': instance.endAt,
      'workoutId': instance.workoutId,
    };
