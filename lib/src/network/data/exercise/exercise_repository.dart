import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/exercise/exercise.dart';

abstract class ExerciseRepository {
  Future<MResult<MExercise>> getExerciseById({required String id});
  Future<MResult<List<MExercise>>> getExerciseOfWorkout({required String id});
}
