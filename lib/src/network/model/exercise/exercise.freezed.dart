// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MExercise _$MExerciseFromJson(Map<String, dynamic> json) {
  return _MExercise.fromJson(json);
}

/// @nodoc
mixin _$MExercise {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get sets => throw _privateConstructorUsedError;
  int get minRest => throw _privateConstructorUsedError;
  int get endAt => throw _privateConstructorUsedError;
  String get workoutId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MExerciseCopyWith<MExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MExerciseCopyWith<$Res> {
  factory $MExerciseCopyWith(MExercise value, $Res Function(MExercise) then) =
      _$MExerciseCopyWithImpl<$Res, MExercise>;
  @useResult
  $Res call(
      {String id,
      String name,
      int sets,
      int minRest,
      int endAt,
      String workoutId});
}

/// @nodoc
class _$MExerciseCopyWithImpl<$Res, $Val extends MExercise>
    implements $MExerciseCopyWith<$Res> {
  _$MExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sets = null,
    Object? minRest = null,
    Object? endAt = null,
    Object? workoutId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
      minRest: null == minRest
          ? _value.minRest
          : minRest // ignore: cast_nullable_to_non_nullable
              as int,
      endAt: null == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as int,
      workoutId: null == workoutId
          ? _value.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MExerciseImplCopyWith<$Res>
    implements $MExerciseCopyWith<$Res> {
  factory _$$MExerciseImplCopyWith(
          _$MExerciseImpl value, $Res Function(_$MExerciseImpl) then) =
      __$$MExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int sets,
      int minRest,
      int endAt,
      String workoutId});
}

/// @nodoc
class __$$MExerciseImplCopyWithImpl<$Res>
    extends _$MExerciseCopyWithImpl<$Res, _$MExerciseImpl>
    implements _$$MExerciseImplCopyWith<$Res> {
  __$$MExerciseImplCopyWithImpl(
      _$MExerciseImpl _value, $Res Function(_$MExerciseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sets = null,
    Object? minRest = null,
    Object? endAt = null,
    Object? workoutId = null,
  }) {
    return _then(_$MExerciseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
      minRest: null == minRest
          ? _value.minRest
          : minRest // ignore: cast_nullable_to_non_nullable
              as int,
      endAt: null == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as int,
      workoutId: null == workoutId
          ? _value.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MExerciseImpl extends _MExercise {
  const _$MExerciseImpl(
      {required this.id,
      this.name = 'None',
      this.sets = 0,
      this.minRest = 0,
      this.endAt = 0,
      this.workoutId = ''})
      : super._();

  factory _$MExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MExerciseImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int sets;
  @override
  @JsonKey()
  final int minRest;
  @override
  @JsonKey()
  final int endAt;
  @override
  @JsonKey()
  final String workoutId;

  @override
  String toString() {
    return 'MExercise(id: $id, name: $name, sets: $sets, minRest: $minRest, endAt: $endAt, workoutId: $workoutId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.minRest, minRest) || other.minRest == minRest) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.workoutId, workoutId) ||
                other.workoutId == workoutId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, sets, minRest, endAt, workoutId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MExerciseImplCopyWith<_$MExerciseImpl> get copyWith =>
      __$$MExerciseImplCopyWithImpl<_$MExerciseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MExerciseImplToJson(
      this,
    );
  }
}

abstract class _MExercise extends MExercise {
  const factory _MExercise(
      {required final String id,
      final String name,
      final int sets,
      final int minRest,
      final int endAt,
      final String workoutId}) = _$MExerciseImpl;
  const _MExercise._() : super._();

  factory _MExercise.fromJson(Map<String, dynamic> json) =
      _$MExerciseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get sets;
  @override
  int get minRest;
  @override
  int get endAt;
  @override
  String get workoutId;
  @override
  @JsonKey(ignore: true)
  _$$MExerciseImplCopyWith<_$MExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
