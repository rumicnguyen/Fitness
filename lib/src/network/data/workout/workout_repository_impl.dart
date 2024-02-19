import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/network/data/workout/workout_reference.dart';
import 'package:fitness_app/src/network/data/workout/workout_repository.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:fitness_app/src/utils/popular.dart';

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

  // TODO: Using Cloud Functions
  Future<MResult> updateMostPopular() async {
    try {
      MResult<List<MWorkout>> listWorkout = await getWorkouts();
      if (listWorkout.isSuccess && listWorkout.data != null) {
        for (var element in listWorkout.data!) {
          final core = await PopularUtils.popularCoreOf(element.id);
          if (core.isSuccess && core.data != null) {
            if (core.data != element.popular) {
              await workoutRef.update(
                element.id,
                {
                  'popular': core.data!,
                },
              );
            }
          }
        }
        return MResult.success('success');
      }
      return MResult.error('error');
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<List<MWorkout>>> getMostPopular() async {
    try {
      MResult<List<MWorkout>> list = await getWorkouts();
      if (list.isSuccess && list.data != null) {
        final List<MWorkout> result = List.from(list.data!);
        PopularUtils.dataSort(result);
        if (result.length <= 10) {
          return MResult.success(result);
        }
        return MResult.success(list.data!.sublist(0, 9));
      }
      return MResult.error('error');
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
