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
      minimumTime: json['minimumTime'] as int? ?? 0,
      maximumTime: json['maximumTime'] as int? ?? 0,
      exercises: json['exercises'] as int? ?? 0,
      level: $enumDecodeNullable(_$WorkoutLevelEnumMap, json['level']) ??
          WorkoutLevel.none,
      members: json['members'] as int? ?? 0,
      video: json['video'] as String? ?? '',
      discipline: $enumDecodeNullable(
              _$DisciplineActivityEnumMap, json['discipline']) ??
          DisciplineActivity.gym,
      entryFee: json['entryFee'] as int? ?? 0,
      popular: (json['popular'] as num?)?.toDouble() ?? 0.0,
      goals:
          (json['goals'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      tag: json['tag'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
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
      'video': instance.video,
      'discipline': _$DisciplineActivityEnumMap[instance.discipline]!,
      'entryFee': instance.entryFee,
      'popular': instance.popular,
      'goals': instance.goals,
      'tag': instance.tag,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$WorkoutLevelEnumMap = {
  WorkoutLevel.none: 'none',
  WorkoutLevel.any: 'any',
  WorkoutLevel.simple: 'simple',
  WorkoutLevel.medium: 'medium',
  WorkoutLevel.entry: 'entry',
};

const _$DisciplineActivityEnumMap = {
  DisciplineActivity.any: 'any',
  DisciplineActivity.gym: 'gym',
};
