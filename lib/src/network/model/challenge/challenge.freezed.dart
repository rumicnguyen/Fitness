// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MChallenge _$MChallengeFromJson(Map<String, dynamic> json) {
  return _MChallenge.fromJson(json);
}

/// @nodoc
mixin _$MChallenge {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  List<MWorkout> get workouts => throw _privateConstructorUsedError;
  WorkoutLevel get level => throw _privateConstructorUsedError;
  int get members => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int? get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MChallengeCopyWith<MChallenge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MChallengeCopyWith<$Res> {
  factory $MChallengeCopyWith(
          MChallenge value, $Res Function(MChallenge) then) =
      _$MChallengeCopyWithImpl<$Res, MChallenge>;
  @useResult
  $Res call(
      {String id,
      String name,
      String thumbnail,
      List<MWorkout> workouts,
      WorkoutLevel level,
      int members,
      bool isActive,
      int? tag});
}

/// @nodoc
class _$MChallengeCopyWithImpl<$Res, $Val extends MChallenge>
    implements $MChallengeCopyWith<$Res> {
  _$MChallengeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? thumbnail = null,
    Object? workouts = null,
    Object? level = null,
    Object? members = null,
    Object? isActive = null,
    Object? tag = freezed,
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
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      workouts: null == workouts
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<MWorkout>,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as WorkoutLevel,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MChallengeImplCopyWith<$Res>
    implements $MChallengeCopyWith<$Res> {
  factory _$$MChallengeImplCopyWith(
          _$MChallengeImpl value, $Res Function(_$MChallengeImpl) then) =
      __$$MChallengeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String thumbnail,
      List<MWorkout> workouts,
      WorkoutLevel level,
      int members,
      bool isActive,
      int? tag});
}

/// @nodoc
class __$$MChallengeImplCopyWithImpl<$Res>
    extends _$MChallengeCopyWithImpl<$Res, _$MChallengeImpl>
    implements _$$MChallengeImplCopyWith<$Res> {
  __$$MChallengeImplCopyWithImpl(
      _$MChallengeImpl _value, $Res Function(_$MChallengeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? thumbnail = null,
    Object? workouts = null,
    Object? level = null,
    Object? members = null,
    Object? isActive = null,
    Object? tag = freezed,
  }) {
    return _then(_$MChallengeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      workouts: null == workouts
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<MWorkout>,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as WorkoutLevel,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MChallengeImpl extends _MChallenge {
  const _$MChallengeImpl(
      {required this.id,
      this.name = 'None',
      this.thumbnail = 'None',
      final List<MWorkout> workouts = const [],
      this.level = WorkoutLevel.none,
      this.members = 0,
      this.isActive = true,
      this.tag})
      : _workouts = workouts,
        super._();

  factory _$MChallengeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MChallengeImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String thumbnail;
  final List<MWorkout> _workouts;
  @override
  @JsonKey()
  List<MWorkout> get workouts {
    if (_workouts is EqualUnmodifiableListView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  @JsonKey()
  final WorkoutLevel level;
  @override
  @JsonKey()
  final int members;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final int? tag;

  @override
  String toString() {
    return 'MChallenge(id: $id, name: $name, thumbnail: $thumbnail, workouts: $workouts, level: $level, members: $members, isActive: $isActive, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MChallengeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            const DeepCollectionEquality().equals(other._workouts, _workouts) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.members, members) || other.members == members) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      thumbnail,
      const DeepCollectionEquality().hash(_workouts),
      level,
      members,
      isActive,
      tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MChallengeImplCopyWith<_$MChallengeImpl> get copyWith =>
      __$$MChallengeImplCopyWithImpl<_$MChallengeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MChallengeImplToJson(
      this,
    );
  }
}

abstract class _MChallenge extends MChallenge {
  const factory _MChallenge(
      {required final String id,
      final String name,
      final String thumbnail,
      final List<MWorkout> workouts,
      final WorkoutLevel level,
      final int members,
      final bool isActive,
      final int? tag}) = _$MChallengeImpl;
  const _MChallenge._() : super._();

  factory _MChallenge.fromJson(Map<String, dynamic> json) =
      _$MChallengeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get thumbnail;
  @override
  List<MWorkout> get workouts;
  @override
  WorkoutLevel get level;
  @override
  int get members;
  @override
  bool get isActive;
  @override
  int? get tag;
  @override
  @JsonKey(ignore: true)
  _$$MChallengeImplCopyWith<_$MChallengeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
