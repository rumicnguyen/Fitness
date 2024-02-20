import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/src/network/data/enum/gender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class MUser with _$MUser {
  const MUser._();
  const factory MUser({
    required String id,
    @Default('User') String name,
    @Default(
      'https://firebasestorage.googleapis.com/v0/b/dominic-fitness-app.appspot.com/o/users%2Fimages%2Fdefault_avatar.jpg?alt=media&token=c18f091a-8d2d-4565-a84f-9e936e495ab2',
    )
    String avatar,
    @Default('') String email,
    @Default(150) double height,
    @Default(50) double weight,
    @Default(Gender.male) Gender gender,
    @Default(18) int age,
    @Default([]) List<String> target,
    @Default([]) List<String> friends,
    @Default(0) int workoutsCompleted,
    @Default(0) int hoursTraining,
    @Default(0) int challengeParticipatedIn,
    @Default([]) List<String> favoriteWorkout,
    DateTime? createdAt,
  }) = _MUser;

  factory MUser.empty() {
    return MUser(id: '', createdAt: DateTime.now());
  }

  factory MUser.fromJson(Map<String, Object?> json) => _$MUserFromJson(json);

  factory MUser.fromEmailAccount(User account) {
    return MUser(
      name: account.displayName ?? '',
      email: account.email ?? '',
      avatar: account.photoURL ?? '',
      id: account.uid,
    );
  }
}
