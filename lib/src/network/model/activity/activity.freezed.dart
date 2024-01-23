// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MActivity _$MActivityFromJson(Map<String, dynamic> json) {
  return _MActivity.fromJson(json);
}

/// @nodoc
mixin _$MActivity {
  String get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  int? get workoutCompeleted => throw _privateConstructorUsedError;
  int? get hours => throw _privateConstructorUsedError;
  int? get challengeParticipatedIn => throw _privateConstructorUsedError;
  int? get kcal => throw _privateConstructorUsedError;
  double? get km => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MActivityCopyWith<MActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MActivityCopyWith<$Res> {
  factory $MActivityCopyWith(MActivity value, $Res Function(MActivity) then) =
      _$MActivityCopyWithImpl<$Res, MActivity>;
  @useResult
  $Res call(
      {String id,
      String? userId,
      DateTime? date,
      int? workoutCompeleted,
      int? hours,
      int? challengeParticipatedIn,
      int? kcal,
      double? km});
}

/// @nodoc
class _$MActivityCopyWithImpl<$Res, $Val extends MActivity>
    implements $MActivityCopyWith<$Res> {
  _$MActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? date = freezed,
    Object? workoutCompeleted = freezed,
    Object? hours = freezed,
    Object? challengeParticipatedIn = freezed,
    Object? kcal = freezed,
    Object? km = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      workoutCompeleted: freezed == workoutCompeleted
          ? _value.workoutCompeleted
          : workoutCompeleted // ignore: cast_nullable_to_non_nullable
              as int?,
      hours: freezed == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int?,
      challengeParticipatedIn: freezed == challengeParticipatedIn
          ? _value.challengeParticipatedIn
          : challengeParticipatedIn // ignore: cast_nullable_to_non_nullable
              as int?,
      kcal: freezed == kcal
          ? _value.kcal
          : kcal // ignore: cast_nullable_to_non_nullable
              as int?,
      km: freezed == km
          ? _value.km
          : km // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MActivityImplCopyWith<$Res>
    implements $MActivityCopyWith<$Res> {
  factory _$$MActivityImplCopyWith(
          _$MActivityImpl value, $Res Function(_$MActivityImpl) then) =
      __$$MActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? userId,
      DateTime? date,
      int? workoutCompeleted,
      int? hours,
      int? challengeParticipatedIn,
      int? kcal,
      double? km});
}

/// @nodoc
class __$$MActivityImplCopyWithImpl<$Res>
    extends _$MActivityCopyWithImpl<$Res, _$MActivityImpl>
    implements _$$MActivityImplCopyWith<$Res> {
  __$$MActivityImplCopyWithImpl(
      _$MActivityImpl _value, $Res Function(_$MActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? date = freezed,
    Object? workoutCompeleted = freezed,
    Object? hours = freezed,
    Object? challengeParticipatedIn = freezed,
    Object? kcal = freezed,
    Object? km = freezed,
  }) {
    return _then(_$MActivityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      workoutCompeleted: freezed == workoutCompeleted
          ? _value.workoutCompeleted
          : workoutCompeleted // ignore: cast_nullable_to_non_nullable
              as int?,
      hours: freezed == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int?,
      challengeParticipatedIn: freezed == challengeParticipatedIn
          ? _value.challengeParticipatedIn
          : challengeParticipatedIn // ignore: cast_nullable_to_non_nullable
              as int?,
      kcal: freezed == kcal
          ? _value.kcal
          : kcal // ignore: cast_nullable_to_non_nullable
              as int?,
      km: freezed == km
          ? _value.km
          : km // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MActivityImpl extends _MActivity {
  const _$MActivityImpl(
      {required this.id,
      this.userId,
      this.date,
      this.workoutCompeleted,
      this.hours,
      this.challengeParticipatedIn,
      this.kcal,
      this.km})
      : super._();

  factory _$MActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MActivityImplFromJson(json);

  @override
  final String id;
  @override
  final String? userId;
  @override
  final DateTime? date;
  @override
  final int? workoutCompeleted;
  @override
  final int? hours;
  @override
  final int? challengeParticipatedIn;
  @override
  final int? kcal;
  @override
  final double? km;

  @override
  String toString() {
    return 'MActivity(id: $id, userId: $userId, date: $date, workoutCompeleted: $workoutCompeleted, hours: $hours, challengeParticipatedIn: $challengeParticipatedIn, kcal: $kcal, km: $km)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.workoutCompeleted, workoutCompeleted) ||
                other.workoutCompeleted == workoutCompeleted) &&
            (identical(other.hours, hours) || other.hours == hours) &&
            (identical(
                    other.challengeParticipatedIn, challengeParticipatedIn) ||
                other.challengeParticipatedIn == challengeParticipatedIn) &&
            (identical(other.kcal, kcal) || other.kcal == kcal) &&
            (identical(other.km, km) || other.km == km));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, date,
      workoutCompeleted, hours, challengeParticipatedIn, kcal, km);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MActivityImplCopyWith<_$MActivityImpl> get copyWith =>
      __$$MActivityImplCopyWithImpl<_$MActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MActivityImplToJson(
      this,
    );
  }
}

abstract class _MActivity extends MActivity {
  const factory _MActivity(
      {required final String id,
      final String? userId,
      final DateTime? date,
      final int? workoutCompeleted,
      final int? hours,
      final int? challengeParticipatedIn,
      final int? kcal,
      final double? km}) = _$MActivityImpl;
  const _MActivity._() : super._();

  factory _MActivity.fromJson(Map<String, dynamic> json) =
      _$MActivityImpl.fromJson;

  @override
  String get id;
  @override
  String? get userId;
  @override
  DateTime? get date;
  @override
  int? get workoutCompeleted;
  @override
  int? get hours;
  @override
  int? get challengeParticipatedIn;
  @override
  int? get kcal;
  @override
  double? get km;
  @override
  @JsonKey(ignore: true)
  _$$MActivityImplCopyWith<_$MActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
