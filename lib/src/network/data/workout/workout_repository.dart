import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/filter_workout/filter_workout.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

abstract class WorkoutRepository {
  Future<MResult<MWorkout>> getWorkoutById({required String id});
  Future<MResult<List<MWorkout>>> getWorkouts();
  Future<MResult<List<MWorkout>>> getNextWorkoutsUser({required String id});
  Future<MResult<List<MWorkout>>> getNewSessions();
  Future<MResult<List<MWorkout>>> getMostPopular();
  Future<MResult<List<MWorkout>>> getPodcasts();
  Future<MResult<List<MWorkout>>> getFilterWorkout({required MFilterWorkout filterWorkout});
  Future<MResult<MWorkout>> addWorkout({required MWorkout workout});
}
