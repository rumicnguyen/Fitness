import 'package:fitness_app/gen/assets.gen.dart';
import 'package:fitness_app/src/network/data/user/user_repository.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<MResult<MUser>> addUser({required MUser user}) {
    // TODO: implement addUser
    throw UnimplementedError();
  }

  @override
  Future<MResult<List<MUserWorkout>>> getFriendsActivity({
    required String id,
  }) async {
    List<MUserWorkout> list = [
      MUserWorkout(
        id: '1',
        userName: 'Guy Hawkins',
        workoutName: 'jogging workout',
        workoutImage: Assets.images.item7.path,
      ),
      MUserWorkout(
        id: '2',
        userName: 'Alan',
        workoutName: 'basketball',
        workoutImage: Assets.images.item9.path,
      ),
      MUserWorkout(
        id: '3',
        userName: 'Olivia',
        workoutName: 'gym',
        workoutImage: Assets.images.item5.path,
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
  Future<MResult<MUser>> getUser({required String id}) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
