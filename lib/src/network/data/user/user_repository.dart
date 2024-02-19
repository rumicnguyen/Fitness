import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';

abstract class UserRepository {
  Future<MResult<MUser>> getUser({required String id});
  Future<MResult<List<MUser>>> getUsers();
  Future<MResult<MUser>> getOrAddUser(MUser user);
  Future<MResult<List<MUser>>> getFriendsUser({required String id});
  Future<MResult<List<MUserWorkout>>> getFriendsActivity({required String id});
  Future<MResult<MUser>> addUser({required MUser user});
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
  });
  Future<MResult<MUser>> updateFavoriteWorkout({
    required MUser user,
    required String workoutId,
  });
}
