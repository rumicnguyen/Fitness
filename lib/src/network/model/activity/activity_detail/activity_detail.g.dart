// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MActivityDetailImpl _$$MActivityDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$MActivityDetailImpl(
      id: json['id'] as String,
      activityId: json['activityId'] as String?,
      workoutId: json['workoutId'] as String?,
      time: $enumDecodeNullable(_$TimeDataEnumMap, json['time']) ??
          TimeData.hour_24h,
      value: (json['value'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$MActivityDetailImplToJson(
        _$MActivityDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activityId': instance.activityId,
      'workoutId': instance.workoutId,
      'time': _$TimeDataEnumMap[instance.time]!,
      'value': instance.value,
    };

const _$TimeDataEnumMap = {
  TimeData.hour_1h: 'hour_1h',
  TimeData.hour_2h: 'hour_2h',
  TimeData.hour_3h: 'hour_3h',
  TimeData.hour_4h: 'hour_4h',
  TimeData.hour_5h: 'hour_5h',
  TimeData.hour_6h: 'hour_6h',
  TimeData.hour_7h: 'hour_7h',
  TimeData.hour_8h: 'hour_8h',
  TimeData.hour_9h: 'hour_9h',
  TimeData.hour_10h: 'hour_10h',
  TimeData.hour_11h: 'hour_11h',
  TimeData.hour_12h: 'hour_12h',
  TimeData.hour_13h: 'hour_13h',
  TimeData.hour_14h: 'hour_14h',
  TimeData.hour_15h: 'hour_15h',
  TimeData.hour_16h: 'hour_16h',
  TimeData.hour_17h: 'hour_17h',
  TimeData.hour_18h: 'hour_18h',
  TimeData.hour_19h: 'hour_19h',
  TimeData.hour_20h: 'hour_20h',
  TimeData.hour_21h: 'hour_21h',
  TimeData.hour_22h: 'hour_22h',
  TimeData.hour_23h: 'hour_23h',
  TimeData.hour_24h: 'hour_24h',
};
