import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';


abstract class UserWorkoutRepository {
  Future<MResult<MUserWorkout>> getUserWorkout({required String id});
  Future<MResult<MUserWorkout>> getUpdateOrAddUserWorkout(MUserWorkout userWorkout);
  Future<MResult<List<MUserWorkout>>> getFriendsActivity({required String id});
  Future<MResult<MUserWorkout>> addUserWorkout({required MUserWorkout userWorkout});
  Future<MResult<MUserWorkout>> update({
    required MUserWorkout userWorkout,
    bool? isFinished,
    DateTime? finishAt,
    DateTime? startAt,
  });
}
