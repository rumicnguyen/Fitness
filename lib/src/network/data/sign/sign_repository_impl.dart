import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/src/network/data/sign/sign_repository.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/error_code.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/social_user/social_user.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignRepositoryImpl extends SignRepository {
  @override
  Future<MResult<MUser>> connectBEWithGoogle(MSocialUser user) async {
    try {
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
          accessToken: user.accessToken, idToken: user.idToken);
      // Once signed in, return the UserCredential
      final UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final firebaseUser = result.user;
      final newUser = MUser(
        id: firebaseUser?.uid ?? '',
        email: user.email,
        name: user.fullName,
      );
      final userResult = await DomainManager().user.getOrAddUser(newUser);

      return MResult.success(userResult.data ?? newUser);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<String>> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<MResult> logOut(MUser user) async {
    try {
      await FirebaseAuth.instance.signOut();
      return MResult.success(user);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<MUser>> loginWithEmail({required String email, required String password}) {
    // TODO: implement loginWithEmail
    throw UnimplementedError();
  }

  @override
  Future<MResult<MSocialUser>> loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final bool isSignedIn = await googleSignIn.isSignedIn();
      if (isSignedIn) {
        await googleSignIn.signOut();
      }
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      if (googleUser != null && googleAuth != null) {
        return MResult.success(
            MSocialUser.fromGoogleAccount(googleUser, googleAuth));
      } else {
        return MResult.error(MErrorCode.unknown);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult> removeAccount(MUser user) {
    // TODO: implement removeAccount
    throw UnimplementedError();
  }

  @override
  Future<MResult<MUser>> signUpWithEmail({required String email, required String password, required String name}) {
    // TODO: implement signUpWithEmail
    throw UnimplementedError();
  }
 
}
