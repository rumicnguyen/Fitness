// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MWorkoutImpl _$$MWorkoutImplFromJson(Map<String, dynamic> json) =>
    _$MWorkoutImpl(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'None',
      thumbnail: json['thumbnail'] as String? ?? 'None',
      backgroundImage: json['backgroundImage'] as String? ?? 'None',
      minimumTime: json['minimumTime'] as int?,
      maximumTime: json['maximumTime'] as int?,
      exercises: json['exercises'] as int? ?? 0,
      level: $enumDecodeNullable(_$WorkoutLevelEnumMap, json['level']) ??
          WorkoutLevel.none,
      members: json['members'] as int? ?? 0,
      tag: json['tag'] as int?,
    );

Map<String, dynamic> _$$MWorkoutImplToJson(_$MWorkoutImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'backgroundImage': instance.backgroundImage,
      'minimumTime': instance.minimumTime,
      'maximumTime': instance.maximumTime,
      'exercises': instance.exercises,
      'level': _$WorkoutLevelEnumMap[instance.level]!,
      'members': instance.members,
      'tag': instance.tag,
    };

const _$WorkoutLevelEnumMap = {
  WorkoutLevel.none: 'none',
  WorkoutLevel.any: 'any',
  WorkoutLevel.simple: 'simple',
  WorkoutLevel.medium: 'medium',
  WorkoutLevel.entry: 'entry',
};
