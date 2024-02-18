import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/network/firebase/base_collection.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

class WorkoutReference extends BaseCollectionReference<MWorkout> {
  WorkoutReference()
      : super(
          FirebaseFirestore.instance
              .collection('workout')
              .withConverter<MWorkout>(
                fromFirestore: (snapshot, options) =>
                    MWorkout.fromJson(snapshot.data() as Map<String, dynamic>),
                toFirestore: (chatRoom, _) => chatRoom.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<MWorkout>> addWorkout(MWorkout workout) async {
    try {
      final result = await get(workout.id);
      if (result.isSuccess == true) {
        return MResult.error('Workout already exists');
      } else {
        final MResult<MWorkout> result = await add(workout);
        return MResult.success(result.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MWorkout>>> getWorkouts() async {
    try {
      final QuerySnapshot<MWorkout> query = await ref.get();
      final docs = query.docs.map((e) => e.data()).toList();
      return MResult.success(docs);
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MWorkout>>> getRecommendedWorkouts(
      List<String> goals) async {
    try {
      final QuerySnapshot<MWorkout> query = await ref
          .where(
            'goals',
            arrayContainsAny: goals,
          )
          .get();
      final docs = query.docs.map((e) => e.data()).toList();
      return MResult.success(docs);
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
