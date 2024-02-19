import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/firebase/base_collection.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';

class UserWorkoutReference extends BaseCollectionReference<MUserWorkout> {
  UserWorkoutReference()
      : super(
          FirebaseFirestore.instance
              .collection('userWorkout')
              .withConverter<MUserWorkout>(
                fromFirestore: (snapshot, options) => MUserWorkout.fromJson(
                    snapshot.data() as Map<String, dynamic>),
                toFirestore: (chatRoom, _) => chatRoom.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  DomainManager get domain => DomainManager();

  Future<MResult<MUserWorkout>> addUserWorkout(MUserWorkout userWorkout) async {
    try {
      final result = await get(userWorkout.id);
      if (result.isSuccess == true) {
        return MResult.error('User Workout already exists');
      } else {
        final MResult<MUserWorkout> result = await add(userWorkout);
        return MResult.success(result.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<MUserWorkout>> getUpdateOrAddUserWorkout(
    MUserWorkout userWorkout,
  ) async {
    try {
      final user = await domain.user.getUser(id: userWorkout.userId ?? '');
      if (user.isError) {
        return MResult.error(user.error);
      }
      final workout =
          await domain.workout.getWorkoutById(id: userWorkout.workoutId ?? '');
      if (workout.isError) {
        return MResult.error(workout.error);
      }
      final getResult = await get(userWorkout.id);
      if (getResult.isSuccess == true && getResult.data != null) {
        if (getResult.data!.isFinished) {
          final result = await update(userWorkout.id, {
            'startAt': DateTime.now(),
          });
          if (result.isSuccess) {
            return MResult.success(result.data);
          }
        }
      } else {
        final MResult<MUserWorkout> result = await set(userWorkout);
        if (result.isSuccess) {
          return MResult.success(result.data);
        }
      }
      return MResult.error('error');
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MUserWorkout>>> getUserWorkouts() async {
    try {
      final QuerySnapshot<MUserWorkout> query =
          await ref.get().timeout(const Duration(seconds: 10));
      final docs = query.docs.map((e) => e.data()).toList();
      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MUserWorkout>>> getUserWorkoutByUserId({
    required String userId,
  }) async {
    try {
      final query = await ref
          .where(
            'userId',
            isEqualTo: userId,
          )
          .get();

      List<MUserWorkout> result = query.docs.map((e) => e.data()).toList();

      MResult.success(result);

      return MResult.error('error');
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MUserWorkout>>> getUserWorkoutByWorkoutId({
    required String workoutId,
  }) async {
    try {
      final query = await ref
          .where(
            'workoutId',
            isEqualTo: workoutId,
          )
          .get();

      List<MUserWorkout> result = query.docs.map((e) => e.data()).toList();

      return MResult.success(result);
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
