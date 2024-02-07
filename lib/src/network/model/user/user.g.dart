// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MUserImpl _$$MUserImplFromJson(Map<String, dynamic> json) => _$MUserImpl(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'user',
      avatar: json['avatar'] as String? ?? 'avatar.png',
      email: json['email'] as String?,
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      gender: json['gender'] as String?,
      age: json['age'] as int?,
      target: (json['target'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      friends: (json['friends'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      workoutsCompleted: json['workoutsCompleted'] as int? ?? 0,
      hoursTraining: json['hoursTraining'] as int? ?? 0,
      challengeParticipatedIn: json['challengeParticipatedIn'] as int? ?? 0,
      favoriteWorkout: (json['favoriteWorkout'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MUserImplToJson(_$MUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'email': instance.email,
      'height': instance.height,
      'weight': instance.weight,
      'gender': instance.gender,
      'age': instance.age,
      'target': instance.target,
      'friends': instance.friends,
      'workoutsCompleted': instance.workoutsCompleted,
      'hoursTraining': instance.hoursTraining,
      'challengeParticipatedIn': instance.challengeParticipatedIn,
      'favoriteWorkout': instance.favoriteWorkout,
    };
