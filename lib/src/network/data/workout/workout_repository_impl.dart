import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/network/data/workout/workout_reference.dart';
import 'package:fitness_app/src/network/data/workout/workout_repository.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

class WorkoutRepositoryImpl extends WorkoutRepository {
  final workoutRef = WorkoutReference();
  @override
  Future<MResult<MWorkout>> addWorkout({required MWorkout workout}) {
    // TODO: implement addWorkout
    throw UnimplementedError();
  }

  @override
  Future<MResult<List<MWorkout>>> getNextWorkoutsUser({
    required String id,
  }) async {
    try {
      MResult<List<MWorkout>> list = await getWorkouts();
      if (list.isSuccess && list.data != null) {
        return MResult.success(list.data);
      }
      return MResult.error('error');
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<MWorkout>> getWorkoutById({required String id}) async {
    return workoutRef.get(id);
  }

  @override
  Future<MResult<List<MWorkout>>> getNewSessions() async {
    try {
      MResult<List<MWorkout>> list = await getWorkouts();
      if (list.isSuccess && list.data != null) {
        return MResult.success(list.data);
      }
      return MResult.error('error');
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<List<MWorkout>>> getWorkouts() async {
    return workoutRef.getWorkouts();
  }

  @override
  Future<MResult<List<MWorkout>>> getPodcasts() async {
    try {
      MResult<List<MWorkout>> list = await getWorkouts();
      if (list.isSuccess && list.data != null) {
        return MResult.success(list.data!.sublist(1, 3));
      }
      return MResult.error('error');
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
