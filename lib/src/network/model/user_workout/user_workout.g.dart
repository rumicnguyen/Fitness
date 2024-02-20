// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MUserWorkoutImpl _$$MUserWorkoutImplFromJson(Map<String, dynamic> json) =>
    _$MUserWorkoutImpl(
      id: json['id'] as String,
      userId: json['userId'] as String? ?? '',
      workoutId: json['workoutId'] as String? ?? '',
      workoutName: json['workoutName'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      workoutImage: json['workoutImage'] as String? ?? '',
      startAt: json['startAt'] == null
          ? null
          : DateTime.parse(json['startAt'] as String),
      finishAt: json['finishAt'] == null
          ? null
          : DateTime.parse(json['finishAt'] as String),
      taskDone: json['taskDone'] as int? ?? 0,
      percentCompleted: (json['percentCompleted'] as num?)?.toDouble() ?? 0,
      isFinished: json['isFinished'] as bool? ?? false,
    );

Map<String, dynamic> _$$MUserWorkoutImplToJson(_$MUserWorkoutImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'workoutId': instance.workoutId,
      'workoutName': instance.workoutName,
      'userName': instance.userName,
      'workoutImage': instance.workoutImage,
      'startAt': instance.startAt?.toIso8601String(),
      'finishAt': instance.finishAt?.toIso8601String(),
      'taskDone': instance.taskDone,
      'percentCompleted': instance.percentCompleted,
      'isFinished': instance.isFinished,
    };
