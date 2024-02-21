import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/firebase/base_collection.dart';
import 'package:fitness_app/src/network/model/activity/activity.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user_challenge/user_challenge.dart';
import 'package:fitness_app/src/utils/string_utils.dart';

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

  DomainManager get domain => DomainManager();

  Future<MResult<MUserChallenge>> addUserChallenge(
      MUserChallenge userChallenge) async {
    try {
      final result = await get(userChallenge.id);
      if (result.isSuccess == true) {
        return MResult.error(S.text.error);
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

  Future<MResult<MUserChallenge>> getUpdateOrAddUserChallenge(
    MUserChallenge userChallenge,
  ) async {
    try {
      final user = await domain.user.getUser(id: userChallenge.userId);
      if (user.isError || user.data == null) {
        return MResult.error(user.error);
      }
      final challenge = await domain.challenge
          .getChallengeById(id: userChallenge.challengeId);
      if (challenge.isError || challenge.data == null) {
        return MResult.error(challenge.error);
      }
      final getResult = await isAlready(
        userId: userChallenge.userId,
        challengeId: userChallenge.challengeId,
      );
      if (getResult.isSuccess && getResult.data != null) {
        if (getResult.data!.id.isEmpty) {
          final MResult<MUserChallenge> result = await set(userChallenge);
          if (result.isSuccess) {
            final isIncrease = await isAlready(
              userId: userChallenge.userId,
              challengeId: userChallenge.challengeId,
              isFinished: true,
            );
            if (isIncrease.isSuccess &&
                isIncrease.data != null &&
                isIncrease.data!.id.isEmpty) {
              await domain.challenge.challengeRef
                  .update(userChallenge.challengeId, {
                'members': challenge.data!.members + 1,
              });
              await domain.user.usersRef.update(userChallenge.userId, {
                'challengeParticipatedIn':
                    user.data!.challengeParticipatedIn + 1,
              });
              await domain.activity.addActivity(
                activity: MActivity(
                  id: StringUtils.generateId(),
                  userId: user.data!.id,
                  challengeParticipatedIn: 1,
                  date: DateTime.now(),
                ),
              );
            }

            return MResult.success(result.data);
          }
          return MResult.error(result.error);
        }
        return MResult.error(getResult.error);
      }
      return MResult.error(S.text.error);
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

  Future<MResult<List<MUserChallenge>>> getUserChallengeByUserId({
    required String userId,
  }) async {
    try {
      final query = await ref
          .where(
            'userId',
            isEqualTo: userId,
          )
          .get();

      List<MUserChallenge> result = query.docs.map((e) => e.data()).toList();

      MResult.success(result);

      return MResult.error(S.text.error);
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MUserChallenge>>> getUserChallengeBychallengeId({
    required String challengeId,
  }) async {
    try {
      final query = await ref
          .where(
            'challengeId',
            isEqualTo: challengeId,
          )
          .get();

      List<MUserChallenge> result = query.docs.map((e) => e.data()).toList();

      return MResult.success(result);
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<MUserChallenge>> isAlready({
    required String challengeId,
    required String userId,
    bool isFinished = false,
  }) async {
    try {
      final query = await ref
          .where(
            'challengeId',
            isEqualTo: challengeId,
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

      List<MUserChallenge> result = query.docs.map((e) => e.data()).toList();
      if (result.isNotEmpty) {
        return MResult.success(result.first);
      }
      return MResult.success(MUserChallenge.empty());
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MUserChallenge>>> getNotOrFinished({
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

      List<MUserChallenge> result = query.docs.map((e) => e.data()).toList();
      return MResult.success(result);
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<MUserChallenge>> updateUserChallenge({
    required MUserChallenge userChallenge,
    bool? isFinished,
    DateTime? finishAt,
    DateTime? startAt,
  }) async {
    try {
      final user = await domain.user.getUser(id: userChallenge.userId);
      if (user.isError || user.data == null) {
        return MResult.error(user.error);
      }
      final challenge = await domain.challenge
          .getChallengeById(id: userChallenge.challengeId);
      if (challenge.isError || challenge.data == null) {
        return MResult.error(challenge.error);
      }
      final getResult = await getUserChallengeBy(
        userId: userChallenge.userId,
        challengeId: userChallenge.challengeId,
      );
      if (getResult.isSuccess && getResult.data != null) {
        if (getResult.data!.id.isNotEmpty) {
          await update(getResult.data!.id, {
            "isFinished": isFinished??getResult.data!.isFinished,
            "finishAt": finishAt??getResult.data!.finishAt,
            "startAt": startAt??getResult.data!.startAt,
          });
          final MResult<MUserChallenge> result = await set(userChallenge);
          if (result.isSuccess) {
           
          }
          return MResult.error(result.error);
        }
        return MResult.error(getResult.error);
      }
      return MResult.error(S.text.error);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
