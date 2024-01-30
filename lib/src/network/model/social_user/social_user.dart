import 'package:fitness_app/src/network/model/social_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'social_user.freezed.dart';
part 'social_user.g.dart';

@freezed
class MSocialUser with _$MSocialUser {
  const MSocialUser._();
  const factory MSocialUser({
    required MSocialType type,

    /// Google Access Token
    String? accessToken,

    /// Google ID Token
    String? idToken,

    /// Google information
    String? fullName,
    String? email,
    String? avatar,
    String? birthDate,
    int? gender,
    String? phone,
  }) = _MSocialUser;

  factory MSocialUser.fromJson(Map<String, Object?> json) =>
      _$MSocialUserFromJson(json);

  factory MSocialUser.fromGoogleAccount(
    GoogleSignInAccount account,
    GoogleSignInAuthentication googleAuth,
  ) {
    return MSocialUser(
      type: MSocialType.google,
      fullName: account.displayName,
      email: account.email,
      avatar: account.photoUrl,
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
  }
}
