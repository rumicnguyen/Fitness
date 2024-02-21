import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/network/data/enum/discipline_activity.dart';
import 'package:fitness_app/src/network/data/enum/entry_fee.dart';
import 'package:fitness_app/src/network/data/enum/time_filter.dart';
import 'package:fitness_app/src/network/data/enum/workout_level.dart';
import 'package:fitness_app/src/network/data/user/user_reference.dart';
import 'package:fitness_app/src/network/data/workout/workout_reference.dart';
import 'package:fitness_app/src/network/data/workout/workout_repository.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/filter_workout/filter_workout.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:fitness_app/src/utils/popular.dart';
import 'package:fitness_app/src/utils/utils.dart';

class WorkoutRepositoryImpl extends WorkoutRepository {
  final workoutRef = WorkoutReference();
  final userRef = UserReference();

  @override
  Future<MResult<MWorkout>> addWorkout({required MWorkout workout}) {
    return workoutRef.addWorkout(workout);
  }

  @override
  Future<MResult<List<MWorkout>>> getNextWorkoutsUser({
    required String id,
  }) async {
    try {
      MResult<List<MWorkout>> list = await workoutRef.getNextWorkouts(id);
      if (list.isSuccess && list.data != null) {
        return MResult.success(list.data);
      }
      return MResult.error(list.error);
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
      if (list.isError || list.data == null) {
        return MResult.error(list.error);
      }
      var result = <MWorkout>[];
      for (var element in list.data!) {
        if (element.createdAt != null &&
            Utils.isInThisWeek(element.createdAt!)) {
          result.add(element);
        }
      }
      return MResult.success(result);
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
    return workoutRef.getWorkouts();
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
          return MResult.error(core.error);
        }
        return MResult.success(listWorkout);
      }
      return MResult.error(listWorkout.error);
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
      return MResult.error(list.error);
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<List<MWorkout>>> getFilterWorkout({
    required MFilterWorkout filterWorkout,
  }) async {
    try {
      MResult<List<MWorkout>> list = await getWorkouts();

      if (list.isError || list.data == null) {
        return MResult.error(list.error);
      }

      final List<MWorkout> result = list.data!
          .where((element) =>
              DisciplineActivity.isTrue(
                element.discipline,
                filterWorkout.discipline,
              ) &&
              EntryFee.isTrue(
                element.entryFee,
                filterWorkout.entryFee,
              ) &&
              WorkoutLevel.isTrue(
                element.level,
                filterWorkout.level,
              ) &&
              TimeFilter.isTrue(
                element.minimumTime,
                filterWorkout.time,
              ))
          .toList();

      return MResult.success(result);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<List<MWorkout>>> getRecommendedWorkoutsUser({
    required String id,
  }) async {
    try {
      final user = await userRef.get(id);
      if (user.isError || user.data == null) {
        return MResult.error(user.error);
      }
      final result = await workoutRef.getRecommendedWorkouts(user.data!.target);
      if (result.isError || result.data == null) {
        return MResult.error(result.error);
      }
      return MResult.success(result.data!);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
