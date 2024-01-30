import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class MUser with _$MUser {
  const MUser._();
  const factory MUser({
    required String id,
    String? name,
    String? avatar,
    String? email,
    double? height,
    double? weight,
    String? gender,
    int? age,
    List<String>? target,
    @Default(0) int workoutsCompleted,
    @Default(0) int hoursTraining,
    @Default(0) int challengeParticipatedIn,
  }) = _MUser;

  factory MUser.empty() {
    return const MUser(id: '');
  }

  factory MUser.fromJson(Map<String, Object?> json) => _$MUserFromJson(json);

  factory MUser.fromEmailAccount(User account) {
    return MUser(
      name: account.displayName,
      email: account.email,
      avatar: account.photoURL,
      id: account.uid,
    );
  }
}
