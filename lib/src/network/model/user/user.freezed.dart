// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MUser _$MUserFromJson(Map<String, dynamic> json) {
  return _MUser.fromJson(json);
}

/// @nodoc
mixin _$MUser {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  List<String> get target => throw _privateConstructorUsedError;
  List<String> get friends => throw _privateConstructorUsedError;
  int get workoutsCompleted => throw _privateConstructorUsedError;
  int get hoursTraining => throw _privateConstructorUsedError;
  int get challengeParticipatedIn => throw _privateConstructorUsedError;
  List<String> get favoriteWorkout => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MUserCopyWith<MUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MUserCopyWith<$Res> {
  factory $MUserCopyWith(MUser value, $Res Function(MUser) then) =
      _$MUserCopyWithImpl<$Res, MUser>;
  @useResult
  $Res call(
      {String id,
      String? name,
      String? avatar,
      String? email,
      double? height,
      double? weight,
      String? gender,
      int? age,
      List<String> target,
      List<String> friends,
      int workoutsCompleted,
      int hoursTraining,
      int challengeParticipatedIn,
      List<String> favoriteWorkout,
      DateTime? createdAt});
}

/// @nodoc
class _$MUserCopyWithImpl<$Res, $Val extends MUser>
    implements $MUserCopyWith<$Res> {
  _$MUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? email = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? gender = freezed,
    Object? age = freezed,
    Object? target = null,
    Object? friends = null,
    Object? workoutsCompleted = null,
    Object? hoursTraining = null,
    Object? challengeParticipatedIn = null,
    Object? favoriteWorkout = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workoutsCompleted: null == workoutsCompleted
          ? _value.workoutsCompleted
          : workoutsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      hoursTraining: null == hoursTraining
          ? _value.hoursTraining
          : hoursTraining // ignore: cast_nullable_to_non_nullable
              as int,
      challengeParticipatedIn: null == challengeParticipatedIn
          ? _value.challengeParticipatedIn
          : challengeParticipatedIn // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteWorkout: null == favoriteWorkout
          ? _value.favoriteWorkout
          : favoriteWorkout // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MUserImplCopyWith<$Res> implements $MUserCopyWith<$Res> {
  factory _$$MUserImplCopyWith(
          _$MUserImpl value, $Res Function(_$MUserImpl) then) =
      __$$MUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      String? avatar,
      String? email,
      double? height,
      double? weight,
      String? gender,
      int? age,
      List<String> target,
      List<String> friends,
      int workoutsCompleted,
      int hoursTraining,
      int challengeParticipatedIn,
      List<String> favoriteWorkout,
      DateTime? createdAt});
}

/// @nodoc
class __$$MUserImplCopyWithImpl<$Res>
    extends _$MUserCopyWithImpl<$Res, _$MUserImpl>
    implements _$$MUserImplCopyWith<$Res> {
  __$$MUserImplCopyWithImpl(
      _$MUserImpl _value, $Res Function(_$MUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? email = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? gender = freezed,
    Object? age = freezed,
    Object? target = null,
    Object? friends = null,
    Object? workoutsCompleted = null,
    Object? hoursTraining = null,
    Object? challengeParticipatedIn = null,
    Object? favoriteWorkout = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$MUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      target: null == target
          ? _value._target
          : target // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workoutsCompleted: null == workoutsCompleted
          ? _value.workoutsCompleted
          : workoutsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      hoursTraining: null == hoursTraining
          ? _value.hoursTraining
          : hoursTraining // ignore: cast_nullable_to_non_nullable
              as int,
      challengeParticipatedIn: null == challengeParticipatedIn
          ? _value.challengeParticipatedIn
          : challengeParticipatedIn // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteWorkout: null == favoriteWorkout
          ? _value._favoriteWorkout
          : favoriteWorkout // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MUserImpl extends _MUser {
  const _$MUserImpl(
      {required this.id,
      this.name = 'user',
      this.avatar = 'avatar.png',
      this.email,
      this.height,
      this.weight,
      this.gender,
      this.age,
      final List<String> target = const [],
      final List<String> friends = const [],
      this.workoutsCompleted = 0,
      this.hoursTraining = 0,
      this.challengeParticipatedIn = 0,
      final List<String> favoriteWorkout = const [],
      this.createdAt})
      : _target = target,
        _friends = friends,
        _favoriteWorkout = favoriteWorkout,
        super._();

  factory _$MUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$MUserImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? avatar;
  @override
  final String? email;
  @override
  final double? height;
  @override
  final double? weight;
  @override
  final String? gender;
  @override
  final int? age;
  final List<String> _target;
  @override
  @JsonKey()
  List<String> get target {
    if (_target is EqualUnmodifiableListView) return _target;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_target);
  }

  final List<String> _friends;
  @override
  @JsonKey()
  List<String> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  @override
  @JsonKey()
  final int workoutsCompleted;
  @override
  @JsonKey()
  final int hoursTraining;
  @override
  @JsonKey()
  final int challengeParticipatedIn;
  final List<String> _favoriteWorkout;
  @override
  @JsonKey()
  List<String> get favoriteWorkout {
    if (_favoriteWorkout is EqualUnmodifiableListView) return _favoriteWorkout;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteWorkout);
  }

  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'MUser(id: $id, name: $name, avatar: $avatar, email: $email, height: $height, weight: $weight, gender: $gender, age: $age, target: $target, friends: $friends, workoutsCompleted: $workoutsCompleted, hoursTraining: $hoursTraining, challengeParticipatedIn: $challengeParticipatedIn, favoriteWorkout: $favoriteWorkout, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.age, age) || other.age == age) &&
            const DeepCollectionEquality().equals(other._target, _target) &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            (identical(other.workoutsCompleted, workoutsCompleted) ||
                other.workoutsCompleted == workoutsCompleted) &&
            (identical(other.hoursTraining, hoursTraining) ||
                other.hoursTraining == hoursTraining) &&
            (identical(
                    other.challengeParticipatedIn, challengeParticipatedIn) ||
                other.challengeParticipatedIn == challengeParticipatedIn) &&
            const DeepCollectionEquality()
                .equals(other._favoriteWorkout, _favoriteWorkout) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      avatar,
      email,
      height,
      weight,
      gender,
      age,
      const DeepCollectionEquality().hash(_target),
      const DeepCollectionEquality().hash(_friends),
      workoutsCompleted,
      hoursTraining,
      challengeParticipatedIn,
      const DeepCollectionEquality().hash(_favoriteWorkout),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MUserImplCopyWith<_$MUserImpl> get copyWith =>
      __$$MUserImplCopyWithImpl<_$MUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MUserImplToJson(
      this,
    );
  }
}

abstract class _MUser extends MUser {
  const factory _MUser(
      {required final String id,
      final String? name,
      final String? avatar,
      final String? email,
      final double? height,
      final double? weight,
      final String? gender,
      final int? age,
      final List<String> target,
      final List<String> friends,
      final int workoutsCompleted,
      final int hoursTraining,
      final int challengeParticipatedIn,
      final List<String> favoriteWorkout,
      final DateTime? createdAt}) = _$MUserImpl;
  const _MUser._() : super._();

  factory _MUser.fromJson(Map<String, dynamic> json) = _$MUserImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get avatar;
  @override
  String? get email;
  @override
  double? get height;
  @override
  double? get weight;
  @override
  String? get gender;
  @override
  int? get age;
  @override
  List<String> get target;
  @override
  List<String> get friends;
  @override
  int get workoutsCompleted;
  @override
  int get hoursTraining;
  @override
  int get challengeParticipatedIn;
  @override
  List<String> get favoriteWorkout;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MUserImplCopyWith<_$MUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
