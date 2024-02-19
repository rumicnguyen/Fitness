import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/network/firebase/base_collection.dart';
import 'package:fitness_app/src/network/model/activity/activity.dart';
import 'package:fitness_app/src/network/model/common/result.dart';

class ActivityReference extends BaseCollectionReference<MActivity> {
  ActivityReference()
      : super(
          FirebaseFirestore.instance
              .collection('activity')
              .withConverter<MActivity>(
                fromFirestore: (snapshot, options) =>
                    MActivity.fromJson(snapshot.data() as Map<String, dynamic>),
                toFirestore: (chatRoom, _) => chatRoom.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<MActivity>> addActivity(MActivity activity) async {
    try {
      final result = await get(activity.id);
      if (result.isSuccess == true) {
        return MResult.error('Activity already exists');
      } else {
        final MResult<MActivity> result = await add(activity);
        return MResult.success(result.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MActivity>>> getActivitys() async {
    try {
      final QuerySnapshot<MActivity> query =
          await ref.get().timeout(const Duration(seconds: 10));
      final docs = query.docs.map((e) => e.data()).toList();
      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MActivity>>> getActivityByUserId({
    required String userId,
  }) async {
    try {
      final QuerySnapshot<MActivity> query = await ref
          .where('userId', isEqualTo: userId)
          .get()
          .timeout(const Duration(seconds: 10));
      final docs = query.docs.map((e) => e.data()).toList();
      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
