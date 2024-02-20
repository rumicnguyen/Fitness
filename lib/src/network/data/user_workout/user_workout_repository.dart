import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';

abstract class UserWorkoutRepository {
  Future<MResult<MUserWorkout>> getLastestUserWorkout({required String userId});
  Future<MResult<MUserWorkout>> getUserWorkoutById({required String id});
  Future<MResult<List<MUserWorkout>>> getUserWorkoutByUserId({
    required String userId,
  });
  Future<MResult<List<MUserWorkout>>> getUserWorkoutByWorkoutId({
    required String workoutId,
  });

  Future<MResult<List<MUserWorkout>>> getUserWorkouts();
  Future<MResult<MUserWorkout>> getUpdateOrAddUserWorkout(
    MUserWorkout userWorkout,
  );
  Future<MResult<MUserWorkout>> addUserWorkout({
    required MUserWorkout userWorkout,
  });
  Future<MResult<MUserWorkout>> update({
    required MUserWorkout userWorkout,
    bool? isFinished,
    DateTime? finishAt,
    DateTime? startAt,
  });
}
