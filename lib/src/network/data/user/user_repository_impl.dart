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
        workoutName: 'Workout with ball',
        workoutImage: Assets.images.newTransparent.path,
        idUser: '10',
        idWorkout: '4',
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
  Future<MResult<MUser>> getUser({required String id}) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
