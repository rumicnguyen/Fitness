import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
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
        return MResult.error(S.text.error);
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
      final user = await domain.user.getUser(id: userWorkout.userId);
      if (user.isError || user.data == null) {
        return MResult.error(user.error);
      }
      final workout =
          await domain.workout.getWorkoutById(id: userWorkout.workoutId);
      if (workout.isError || workout.data == null) {
        return MResult.error(workout.error);
      }
      final getResult = await isAlready(
        userId: userWorkout.userId,
        workoutId: userWorkout.workoutId,
      );
      if (getResult.isSuccess && getResult.data != null) {
        if (getResult.data!.id.isNotEmpty) {
          final result = await update(getResult.data!.id, {
            'startAt': DateTime.now().toString(),
          });
          if (result.isSuccess) {
            return MResult.success(getResult.data);
          }
          return MResult.error(result.error);
        } else {
          final MResult<MUserWorkout> result = await set(userWorkout);
          if (result.isSuccess) {
            final isIncrease = await isAlready(
              userId: userWorkout.userId,
              workoutId: userWorkout.workoutId,
              isFinished: true,
            );
            if (isIncrease.isSuccess &&
                isIncrease.data != null &&
                isIncrease.data!.id.isEmpty) {
              await domain.workout.workoutRef.update(userWorkout.workoutId, {
                'members': workout.data!.members + 1,
              });
            }
            return MResult.success(result.data);
          }
          return MResult.error(result.error);
        }
      }
      return MResult.error(S.text.error);
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

      return MResult.error(S.text.error);
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

  Future<MResult<MUserWorkout>> isAlready({
    required String workoutId,
    required String userId,
    bool isFinished = false,
  }) async {
    try {
      final query = await ref
          .where(
            'workoutId',
            isEqualTo: workoutId,
          )
          .where(
            'userId',
            isEqualTo: userId,
          )
          .where(
            'isFinished',
            isEqualTo: isFinished,
          )
          .get();

      List<MUserWorkout> result = query.docs.map((e) => e.data()).toList();
      if (result.isNotEmpty) {
        return MResult.success(result.first);
      }
      return MResult.success(MUserWorkout.empty());
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MUserWorkout>>> getNotOrFinished({
    required String userId,
    bool isFinished = false,
  }) async {
    try {
      final query = await ref
          .where(
            'userId',
            isEqualTo: userId,
          )
          .where(
            'isFinished',
            isEqualTo: isFinished,
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
