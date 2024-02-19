import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/network/firebase/base_collection.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/goal/goal.dart';

class GoalReference extends BaseCollectionReference<MGoal> {
  GoalReference()
      : super(
          FirebaseFirestore.instance.collection('goal').withConverter<MGoal>(
                fromFirestore: (snapshot, options) =>
                    MGoal.fromJson(snapshot.data() as Map<String, dynamic>),
                toFirestore: (chatRoom, _) => chatRoom.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<MGoal>> addGoal(MGoal goal) async {
    try {
      final result = await get(goal.id);
      if (result.isSuccess == true) {
        return MResult.error('Goal already exists');
      } else {
        final MResult<MGoal> result = await add(goal);
        return MResult.success(result.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<MGoal>> getGoalFrom(String goal) async {
    try {
      final query = await ref
          .where('goal', isEqualTo: goal)
          .get()
          .timeout(const Duration(seconds: 10));
      final result = query.docs.map((e) => e.data()).toList();
      if (result.isEmpty) {
        return MResult.error('error');
      }

      return MResult.success(result[0]);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MGoal>>> getGoals() async {
    try {
      final QuerySnapshot<MGoal> query =
          await ref.get().timeout(const Duration(seconds: 10));
      final docs = query.docs.map((e) => e.data()).toList();
      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
