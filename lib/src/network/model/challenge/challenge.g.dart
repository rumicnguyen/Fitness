// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MChallengeImpl _$$MChallengeImplFromJson(Map<String, dynamic> json) =>
    _$MChallengeImpl(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'None',
      thumbnail: json['thumbnail'] as String? ?? 'coming_soon.png',
      decription: json['decription'] as String? ?? 'None',
      workouts: (json['workouts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      level: $enumDecodeNullable(_$WorkoutLevelEnumMap, json['level']) ??
          WorkoutLevel.none,
      members: json['members'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      tag: json['tag'] as int?,
    );

Map<String, dynamic> _$$MChallengeImplToJson(_$MChallengeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'decription': instance.decription,
      'workouts': instance.workouts,
      'level': _$WorkoutLevelEnumMap[instance.level]!,
      'members': instance.members,
      'isActive': instance.isActive,
      'tag': instance.tag,
    };

const _$WorkoutLevelEnumMap = {
  WorkoutLevel.none: 'none',
  WorkoutLevel.any: 'any',
  WorkoutLevel.simple: 'simple',
  WorkoutLevel.medium: 'medium',
  WorkoutLevel.hard: 'hard',
  WorkoutLevel.entry: 'entry',
};
