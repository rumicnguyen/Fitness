// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MActivityDetail _$MActivityDetailFromJson(Map<String, dynamic> json) {
  return _MActivityDetail.fromJson(json);
}

/// @nodoc
mixin _$MActivityDetail {
  String get id => throw _privateConstructorUsedError;
  String? get activityId => throw _privateConstructorUsedError;
  String? get workoutId => throw _privateConstructorUsedError;
  TimeData get time =>
      throw _privateConstructorUsedError; // The number of minute in 1 hour do exercise
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MActivityDetailCopyWith<MActivityDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MActivityDetailCopyWith<$Res> {
  factory $MActivityDetailCopyWith(
          MActivityDetail value, $Res Function(MActivityDetail) then) =
      _$MActivityDetailCopyWithImpl<$Res, MActivityDetail>;
  @useResult
  $Res call(
      {String id,
      String? activityId,
      String? workoutId,
      TimeData time,
      double value});
}

/// @nodoc
class _$MActivityDetailCopyWithImpl<$Res, $Val extends MActivityDetail>
    implements $MActivityDetailCopyWith<$Res> {
  _$MActivityDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? activityId = freezed,
    Object? workoutId = freezed,
    Object? time = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String?,
      workoutId: freezed == workoutId
          ? _value.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as String?,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeData,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MActivityDetailImplCopyWith<$Res>
    implements $MActivityDetailCopyWith<$Res> {
  factory _$$MActivityDetailImplCopyWith(_$MActivityDetailImpl value,
          $Res Function(_$MActivityDetailImpl) then) =
      __$$MActivityDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? activityId,
      String? workoutId,
      TimeData time,
      double value});
}

/// @nodoc
class __$$MActivityDetailImplCopyWithImpl<$Res>
    extends _$MActivityDetailCopyWithImpl<$Res, _$MActivityDetailImpl>
    implements _$$MActivityDetailImplCopyWith<$Res> {
  __$$MActivityDetailImplCopyWithImpl(
      _$MActivityDetailImpl _value, $Res Function(_$MActivityDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? activityId = freezed,
    Object? workoutId = freezed,
    Object? time = null,
    Object? value = null,
  }) {
    return _then(_$MActivityDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String?,
      workoutId: freezed == workoutId
          ? _value.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as String?,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeData,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MActivityDetailImpl extends _MActivityDetail {
  const _$MActivityDetailImpl(
      {required this.id,
      this.activityId,
      this.workoutId,
      this.time = TimeData.hour_24h,
      this.value = 0.0})
      : super._();

  factory _$MActivityDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$MActivityDetailImplFromJson(json);

  @override
  final String id;
  @override
  final String? activityId;
  @override
  final String? workoutId;
  @override
  @JsonKey()
  final TimeData time;
// The number of minute in 1 hour do exercise
  @override
  @JsonKey()
  final double value;

  @override
  String toString() {
    return 'MActivityDetail(id: $id, activityId: $activityId, workoutId: $workoutId, time: $time, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MActivityDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            (identical(other.workoutId, workoutId) ||
                other.workoutId == workoutId) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, activityId, workoutId, time, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MActivityDetailImplCopyWith<_$MActivityDetailImpl> get copyWith =>
      __$$MActivityDetailImplCopyWithImpl<_$MActivityDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MActivityDetailImplToJson(
      this,
    );
  }
}

abstract class _MActivityDetail extends MActivityDetail {
  const factory _MActivityDetail(
      {required final String id,
      final String? activityId,
      final String? workoutId,
      final TimeData time,
      final double value}) = _$MActivityDetailImpl;
  const _MActivityDetail._() : super._();

  factory _MActivityDetail.fromJson(Map<String, dynamic> json) =
      _$MActivityDetailImpl.fromJson;

  @override
  String get id;
  @override
  String? get activityId;
  @override
  String? get workoutId;
  @override
  TimeData get time;
  @override // The number of minute in 1 hour do exercise
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$MActivityDetailImplCopyWith<_$MActivityDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
