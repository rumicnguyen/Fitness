import 'dart:async';

import 'package:fitness_app/src/network/data/user_workout/user_workout_reference.dart';
import 'package:fitness_app/src/network/data/user_workout/user_workout_repository.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';

class UserWorkoutRepositoryImpl extends UserWorkoutRepository {
  final userWorkoutRef = UserWorkoutReference();

  @override
  Future<MResult<MUserWorkout>> addUserWorkout({
    required MUserWorkout userWorkout,
  }) {
    return userWorkoutRef.addUserWorkout(userWorkout);
  }

  @override
  Future<MResult<MUserWorkout>> getUpdateOrAddUserWorkout(
      MUserWorkout userWorkout) {
    return userWorkoutRef.getUpdateOrAddUserWorkout(userWorkout);
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

  @override
  Future<MResult<List<MUserWorkout>>> getUserWorkouts() {
    return userWorkoutRef.getAll();
  }

  @override
  Future<MResult<List<MUserWorkout>>> getUserWorkoutByUserId({
    required String userId,
  }) {
    return userWorkoutRef.getUserWorkoutByUserId(userId: userId);
  }

  @override
  Future<MResult<List<MUserWorkout>>> getUserWorkoutByWorkoutId({
    required String workoutId,
  }) async {
    return userWorkoutRef.getUserWorkoutByWorkoutId(workoutId: workoutId);
  }

  @override
  Future<MResult<MUserWorkout>> getUserWorkoutById({
    required String id,
  }) {
    return userWorkoutRef.get(id);
  }

  @override
  Future<MResult<MUserWorkout>> getLastestUserWorkout({
    required String userId,
  }) async {
    try {
      final userWorkouts =
          await userWorkoutRef.getNotOrFinished(userId: userId);
      if (userWorkouts.isError || userWorkouts.data == null) {
        return MResult.error(userWorkouts.error);
      }

      if (userWorkouts.data!.isEmpty) {
        return MResult.success(MUserWorkout.empty());
      }
      MUserWorkout lastest = userWorkouts.data!.first;
      for (var element in userWorkouts.data!) {
        if (element.startAt != null &&
            lastest.startAt != null &&
            element.startAt!.isAfter(lastest.startAt!)) {
          lastest = element;
        }
      }
      return MResult.success(lastest);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
