import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/network/firebase/base_collection.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user_challenge/user_challenge.dart';

class UserChallengeReference extends BaseCollectionReference<MUserChallenge> {
  UserChallengeReference()
      : super(
          FirebaseFirestore.instance
              .collection('userChallenge')
              .withConverter<MUserChallenge>(
                fromFirestore: (snapshot, options) => MUserChallenge.fromJson(
                    snapshot.data() as Map<String, dynamic>),
                toFirestore: (chatRoom, _) => chatRoom.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<MUserChallenge>> addUserChallenge(
      MUserChallenge userChallenge) async {
    try {
      final result = await get(userChallenge.id);
      if (result.isSuccess == true) {
        return MResult.error('User already exists');
      } else {
        final MResult<MUserChallenge> result = await add(userChallenge);
        return MResult.success(result.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<MUserChallenge>> getUserChallengeBy({
    required String userId,
    required String challengeId,
  }) async {
    try {
      final QuerySnapshot<MUserChallenge> query = await ref
          .where('userId', isEqualTo: userId)
          .where('challengeId', isEqualTo: challengeId)
          .get()
          .timeout(const Duration(seconds: 10));

      final docs = query.docs.map((e) => e.data()).toList();
      final result = docs.firstWhere((element) => element.finishAt == null);
      return MResult.success(result);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MUserChallenge>>> getUserChallenges() async {
    try {
      final QuerySnapshot<MUserChallenge> query =
          await ref.get().timeout(const Duration(seconds: 10));
      final docs = query.docs.map((e) => e.data()).toList();
      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
