import 'package:fitness_app/src/network/data/exercise/exercise_reference.dart';
import 'package:fitness_app/src/network/data/exercise/exercise_repository.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/exercise/exercise.dart';

class ExerciseRepositoryImpl extends ExerciseRepository {
  final exerciseRef = ExerciseReference();
  @override
  Future<MResult<MExercise>> getExerciseById({required String id}) {
    return exerciseRef.get(id);
  }

  @override
  Future<MResult<List<MExercise>>> getExerciseOfWorkout({required String id}) {
    return exerciseRef.getExerciseOfWorkout(id);
  }
}
