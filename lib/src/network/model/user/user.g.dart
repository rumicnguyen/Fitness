// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MUserImpl _$$MUserImplFromJson(Map<String, dynamic> json) => _$MUserImpl(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'User',
      avatar: json['avatar'] as String? ??
          'https://firebasestorage.googleapis.com/v0/b/dominic-fitness-app.appspot.com/o/users%2Fimages%2Fdefault_avatar.jpg?alt=media&token=c18f091a-8d2d-4565-a84f-9e936e495ab2',
      email: json['email'] as String? ?? '',
      height: (json['height'] as num?)?.toDouble() ?? 150,
      weight: (json['weight'] as num?)?.toDouble() ?? 50,
      gender:
          $enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.male,
      age: json['age'] as int? ?? 18,
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
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MUserImplToJson(_$MUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'email': instance.email,
      'height': instance.height,
      'weight': instance.weight,
      'gender': _$GenderEnumMap[instance.gender]!,
      'age': instance.age,
      'target': instance.target,
      'friends': instance.friends,
      'workoutsCompleted': instance.workoutsCompleted,
      'hoursTraining': instance.hoursTraining,
      'challengeParticipatedIn': instance.challengeParticipatedIn,
      'favoriteWorkout': instance.favoriteWorkout,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
