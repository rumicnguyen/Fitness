import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/gender.dart';
import 'package:fitness_app/src/network/data/user/user_reference.dart';
import 'package:fitness_app/src/network/data/user/user_repository.dart';
import 'package:fitness_app/src/network/data/user_challenge/user_challenge_reference.dart';
import 'package:fitness_app/src/network/data/user_workout/user_workout_reference.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/network/model/user_challenge/user_challenge.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';
import 'package:fitness_app/src/services/user_prefs.dart';

class UserRepositoryImpl extends UserRepository {
  final usersRef = UserReference();
  final userWorkoutRef = UserWorkoutReference();
  final userChallengeRef = UserChallengeReference();
  @override
  Future<MResult<MUser>> addUser({required MUser user}) async {
    return usersRef.addUser(user);
  }

  @override
  Future<MResult<MUser>> getOrAddUser(MUser user) async {
    return usersRef.getOrAddUser(user);
  }

  @override
  Future<MResult<List<MUserWorkout>>> getFriendsActivity({
    required String id,
  }) async {
    try {
      final user = await getUser(id: id);
      if (user.isError || user.data == null) {
        return MResult.error(user.error);
      }
      if (user.data!.friends.isEmpty) {
        return MResult.success([]);
      }
      var result = <MUserWorkout>[];
      for (var element in user.data!.friends) {
        final data = await userWorkoutRef.getNotOrFinished(
          userId: element,
          isFinished: true,
        );
        if (data.isSuccess && data.data != null && data.data!.isNotEmpty) {
          data.data!.map((e) => result.add(e));
        }
      }

      return MResult.success(result);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<List<MUser>>> getFriendsUser({required String id}) async {
    try {
      final user = await usersRef.get(id);
      if (user.isSuccess && user.data != null) {
        List<MUser> friends = [];
        for (var element in user.data!.friends) {
          final friend = await usersRef.get(element);
          if (friend.isSuccess && friend.data != null) {
            friends.add(friend.data!);
          } else {
            return MResult.error('Friend not found');
          }
        }
        return MResult.success(friends);
      }
      return MResult.error(user.error);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<MUser>> getUser({required String id}) async {
    try {
      final result = FirebaseAuth.instance.currentUser;
      if (result == null) {
        return MResult.error(S.text.error);
      }
      final user = await usersRef.get(id);
      return MResult.success(user.data);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<MUser>> update({
    required MUser user,
    String? avatar,
    String? name,
    Gender? gender,
    int? age,
    int? challengeParticipatedIn,
    int? hoursTraining,
    int? workoutsCompleted,
    double? height,
    double? weight,
    List<String>? target,
  }) async {
    try {
      final result = await usersRef.update(user.id, {
        'avatar': avatar ?? user.avatar,
        'name': name ?? user.name,
        'age': age ?? user.age,
        'challengeParticipatedIn':
            challengeParticipatedIn ?? user.challengeParticipatedIn,
        'gender': gender?.value ?? user.gender.value,
        'height': height ?? user.height,
        'hoursTraining': hoursTraining ?? user.hoursTraining,
        'weight': weight ?? user.weight,
        'workoutsCompleted': workoutsCompleted ?? user.workoutsCompleted,
        'target': target ?? user.target,
      });
      if (result.isSuccess) {
        final updateUser = await getUser(id: user.id);
        return MResult.success(updateUser.data);
      }
      return MResult.error(result.error);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<MUser>> updateFavoriteWorkout({
    required MUser user,
    required String workoutId,
  }) async {
    try {
      final updateUser = await getUser(id: user.id);
      if (updateUser.isSuccess && updateUser.data != null) {
        final list = List.from(updateUser.data!.favoriteWorkout);
        if (list.contains(workoutId)) {
          list.remove(workoutId);
        } else {
          list.add(workoutId);
        }
        final result = await usersRef.update(user.id, {
          'favoriteWorkout': list,
        });
        if (result.isSuccess) {
          final resultUser = await getUser(id: user.id);
          UserPrefs.instance.setUser(resultUser.data);
          return MResult.success(resultUser.data);
        }
      }
      return MResult.error(updateUser.error);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<List<MUser>>> getUsers() {
    return usersRef.getAll();
  }

  @override
  Future<MResult<MUserChallenge>> getUserChallenge({
    required String userId,
    required String challengeId,
  }) async {
    return userChallengeRef.getUserChallengeBy(
      userId: userId,
      challengeId: challengeId,
    );
  }
}
