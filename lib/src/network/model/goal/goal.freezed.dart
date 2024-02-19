// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MGoal _$MGoalFromJson(Map<String, dynamic> json) {
  return _MGoal.fromJson(json);
}

/// @nodoc
mixin _$MGoal {
  String get id => throw _privateConstructorUsedError;
  String get goal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MGoalCopyWith<MGoal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MGoalCopyWith<$Res> {
  factory $MGoalCopyWith(MGoal value, $Res Function(MGoal) then) =
      _$MGoalCopyWithImpl<$Res, MGoal>;
  @useResult
  $Res call({String id, String goal});
}

/// @nodoc
class _$MGoalCopyWithImpl<$Res, $Val extends MGoal>
    implements $MGoalCopyWith<$Res> {
  _$MGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? goal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MGoalImplCopyWith<$Res> implements $MGoalCopyWith<$Res> {
  factory _$$MGoalImplCopyWith(
          _$MGoalImpl value, $Res Function(_$MGoalImpl) then) =
      __$$MGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String goal});
}

/// @nodoc
class __$$MGoalImplCopyWithImpl<$Res>
    extends _$MGoalCopyWithImpl<$Res, _$MGoalImpl>
    implements _$$MGoalImplCopyWith<$Res> {
  __$$MGoalImplCopyWithImpl(
      _$MGoalImpl _value, $Res Function(_$MGoalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? goal = null,
  }) {
    return _then(_$MGoalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MGoalImpl extends _MGoal {
  const _$MGoalImpl({required this.id, this.goal = ''}) : super._();

  factory _$MGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$MGoalImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String goal;

  @override
  String toString() {
    return 'MGoal(id: $id, goal: $goal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MGoalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.goal, goal) || other.goal == goal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, goal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MGoalImplCopyWith<_$MGoalImpl> get copyWith =>
      __$$MGoalImplCopyWithImpl<_$MGoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MGoalImplToJson(
      this,
    );
  }
}

abstract class _MGoal extends MGoal {
  const factory _MGoal({required final String id, final String goal}) =
      _$MGoalImpl;
  const _MGoal._() : super._();

  factory _MGoal.fromJson(Map<String, dynamic> json) = _$MGoalImpl.fromJson;

  @override
  String get id;
  @override
  String get goal;
  @override
  @JsonKey(ignore: true)
  _$$MGoalImplCopyWith<_$MGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
