import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';

abstract class UserRepository {
  Future<MResult<MUser>> getUser({required String id});
  Future<MResult<List<MUser>>> getFriendsUser({required String id});
  Future<MResult<List<MUserWorkout>>> getFriendsActivity({required String id});
  Future<MResult<MUser>> addUser({required MUser user});
}
