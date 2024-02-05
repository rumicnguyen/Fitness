import 'package:fitness_app/src/network/data/user_workout/user_workout_reference.dart';
import 'package:fitness_app/src/network/data/user_workout/user_workout_repository.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';

class UserWorkoutRepositoryImpl extends UserWorkoutRepository {
  final userWorkoutRef = UserWorkoutReference();
  @override
  Future<MResult<MUserWorkout>> addUserWorkout(
      {required MUserWorkout userWorkout}) {
    // TODO: implement addUserWorkout
    throw UnimplementedError();
  }

  @override
  Future<MResult<List<MUserWorkout>>> getFriendsActivity({required String id}) {
    // TODO: implement getFriendsActivity
    throw UnimplementedError();
  }

  @override
  Future<MResult<MUserWorkout>> getUpdateOrAddUserWorkout(
      MUserWorkout userWorkout) {
    return userWorkoutRef.getUpdateOrAddUserWorkout(userWorkout);
  }

  @override
  Future<MResult<MUserWorkout>> getUserWorkout({required String id}) {
    // TODO: implement getUserWorkout
    throw UnimplementedError();
  }

  @override
  Future<MResult<MUserWorkout>> update({
    required MUserWorkout userWorkout,
    bool? isFinished,
    DateTime? finishAt,
    DateTime? startAt,
  }) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
