import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/firebase/base_collection.dart';
import 'package:fitness_app/src/network/model/activity/activity_detail/activity_detail.dart';
import 'package:fitness_app/src/network/model/common/result.dart';

class ActivityDetailReference extends BaseCollectionReference<MActivityDetail> {
  ActivityDetailReference()
      : super(
          FirebaseFirestore.instance
              .collection('activityDetail')
              .withConverter<MActivityDetail>(
                fromFirestore: (snapshot, options) => MActivityDetail.fromJson(
                    snapshot.data() as Map<String, dynamic>),
                toFirestore: (chatRoom, _) => chatRoom.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<MActivityDetail>> addActivityDetail(
      MActivityDetail activity) async {
    try {
      final result = await get(activity.id);
      if (result.isSuccess == true) {
        return MResult.error(S.text.error);
      } else {
        final MResult<MActivityDetail> result = await add(activity);
        return MResult.success(result.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MActivityDetail>>> getActivityDetails() async {
    try {
      final QuerySnapshot<MActivityDetail> query =
          await ref.get().timeout(const Duration(seconds: 10));
      final docs = query.docs.map((e) => e.data()).toList();
      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MActivityDetail>>> getActivityByUserId({
    required String userId,
  }) async {
    try {
      final QuerySnapshot<MActivityDetail> query = await ref
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
