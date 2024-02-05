import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/gen/assets.gen.dart';
import 'package:fitness_app/src/network/data/user/user_reference.dart';
import 'package:fitness_app/src/network/data/user/user_repository.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';
import 'package:fitness_app/src/services/user_prefs.dart';

class UserRepositoryImpl extends UserRepository {
  final usersRef = UserReference();
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
    List<MUserWorkout> list = [
      MUserWorkout(
        id: '1',
        userName: 'Guy Hawkins',
        workoutName: 'Workout with ball',
        workoutImage: Assets.images.newTransparent.path,
        idUser: 'cLcCa9CWTISEGm6CKOyvaRsOBD93',
        idWorkout: 'lM3ZsYp7DuKHuZqxaYUk',
      ),
      MUserWorkout(
        id: '2',
        userName: 'Alan',
        workoutName: 'Basketball',
        workoutImage: Assets.images.item9.path,
        idUser: '11',
        idWorkout: '5',
      ),
      MUserWorkout(
        id: '3',
        userName: 'Olivia',
        workoutName: 'Get already to the marathon',
        workoutImage: Assets.images.item5.path,
        idUser: '12',
        idWorkout: '1',
      ),
    ];

    return MResult.success(list);
  }

  @override
  Future<MResult<List<MUser>>> getFriendsUser({required String id}) {
    // TODO: implement getFriendsUser
    throw UnimplementedError();
  }

  @override
  Future<MResult<MUser>> getUser({required String id}) async {
    try {
      final result = FirebaseAuth.instance.currentUser;
      if (result == null) {
        return MResult.error('Not user sign in');
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
    String? gender,
    int? age,
    int? challengeParticipatedIn,
    int? hoursTraining,
    int? workoutsCompleted,
    double? height,
    double? weight,
  }) async {
    try {
      final result = await usersRef.update(user.id, {
        'avatar': avatar ?? user.avatar,
        'name': name ?? user.name,
        'age': age ?? user.age,
        'challengeParticipatedIn':
            challengeParticipatedIn ?? user.challengeParticipatedIn,
        'gender': gender ?? user.gender,
        'height': height ?? user.height,
        'hoursTraining': hoursTraining ?? user.hoursTraining,
        'weight': weight ?? user.weight,
        'workoutsCompleted': workoutsCompleted ?? user.workoutsCompleted,
      });
      if (result.isSuccess) {
        final updateUser = await getUser(id: user.id);
        return MResult.success(updateUser.data);
      }
      return MResult.error('error');
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
          UserPrefs.instance.setUser(result.data);
          return MResult.success(resultUser.data);
        }
      }
      return MResult.error('error');
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
