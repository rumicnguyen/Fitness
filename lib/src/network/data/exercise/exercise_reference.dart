import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/network/firebase/base_collection.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/exercise/exercise.dart';
import 'package:fitness_app/src/utils/exercise_sort.dart';

class ExerciseReference extends BaseCollectionReference<MExercise> {
  ExerciseReference()
      : super(
          FirebaseFirestore.instance
              .collection('exercise')
              .withConverter<MExercise>(
                fromFirestore: (snapshot, options) =>
                    MExercise.fromJson(snapshot.data() as Map<String, dynamic>),
                toFirestore: (chatRoom, _) => chatRoom.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<MExercise>> addExercise(MExercise exercise) async {
    try {
      final result = await get(exercise.id);
      if (result.isSuccess == true) {
        return MResult.error('Exercise already exists');
      } else {
        final MResult<MExercise> result = await add(exercise);
        return MResult.success(result.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MExercise>>> getExerciseOfWorkout(
      String workoutId) async {
    try {
      final query = await ref.where('workoutId', isEqualTo: workoutId).get();
      final result = query.docs.map((e) => e.data()).toList();
      ExerciseSort.dataSort(result);
      return MResult.success(result);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MExercise>>> getExercises() async {
    try {
      final QuerySnapshot<MExercise> query =
          await ref.get().timeout(const Duration(seconds: 10));
      final docs = query.docs.map((e) => e.data()).toList();
      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
