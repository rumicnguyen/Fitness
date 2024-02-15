import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/network/firebase/base_collection.dart';
import 'package:fitness_app/src/network/model/challenge/challenge.dart';
import 'package:fitness_app/src/network/model/common/result.dart';

class ChallengeReference extends BaseCollectionReference<MChallenge> {
  ChallengeReference()
      : super(
          FirebaseFirestore.instance.collection('challenge').withConverter<MChallenge>(
                fromFirestore: (snapshot, options) =>
                    MChallenge.fromJson(snapshot.data() as Map<String, dynamic>),
                toFirestore: (chatRoom, _) => chatRoom.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<MChallenge>> addChallenge(MChallenge challenge) async {
    try {
      final result = await get(challenge.id);
      if (result.isSuccess == true) {
        return MResult.error('Challenge already exists');
      } else {
        final MResult<MChallenge> result = await add(challenge);
        return MResult.success(result.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MChallenge>>> getChallenges() async {
    try {
      final QuerySnapshot<MChallenge> query =
          await ref.get().timeout(const Duration(seconds: 10));
      final docs = query.docs.map((e) => e.data()).toList();
      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
