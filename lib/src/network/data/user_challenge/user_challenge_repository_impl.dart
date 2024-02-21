import 'dart:async';

import 'package:fitness_app/src/network/data/user_challenge/user_challenge_reference.dart';
import 'package:fitness_app/src/network/data/user_challenge/user_challenge_repository.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user_challenge/user_challenge.dart';

class UserChallengeRepositoryImpl extends UserChallengeRepository {
  final userChallengeRef = UserChallengeReference();

  @override
  Future<MResult<MUserChallenge>> addUserChallenge({
    required MUserChallenge userChallenge,
  }) {
    return userChallengeRef.addUserChallenge(userChallenge);
  }

  @override
  Future<MResult<MUserChallenge>> getUpdateOrAddUserChallenge(
      MUserChallenge userChallenge) {
    return userChallengeRef.getUpdateOrAddUserChallenge(userChallenge);
  }

  @override
  Future<MResult<MUserChallenge>> update({
    required MUserChallenge userChallenge,
    bool? isFinished,
    DateTime? finishAt,
    DateTime? startAt,
  }) {
    return userChallengeRef.updateUserChallenge(
      userChallenge: userChallenge,
      isFinished: isFinished,
      finishAt: finishAt,
      startAt: startAt,
    );
  }

  @override
  Future<MResult<List<MUserChallenge>>> getUserChallenges() {
    return userChallengeRef.getAll();
  }

  @override
  Future<MResult<List<MUserChallenge>>> getUserChallengeByUserId({
    required String userId,
  }) {
    return userChallengeRef.getUserChallengeByUserId(userId: userId);
  }

  @override
  Future<MResult<List<MUserChallenge>>> getUserChallengeByChallengeId({
    required String challengeId,
  }) async {
    return userChallengeRef.getUserChallengeBychallengeId(
      challengeId: challengeId,
    );
  }

  @override
  Future<MResult<MUserChallenge>> getUserChallengeById({
    required String id,
  }) {
    return userChallengeRef.get(id);
  }

  @override
  Future<MResult<MUserChallenge>> getLastestUserChallenge({
    required String userId,
  }) async {
    try {
      final userChallenges =
          await userChallengeRef.getNotOrFinished(userId: userId);
      if (userChallenges.isError || userChallenges.data == null) {
        return MResult.error(userChallenges.error);
      }

      if (userChallenges.data!.isEmpty) {
        return MResult.success(MUserChallenge.empty());
      }
      MUserChallenge lastest = userChallenges.data!.first;
      for (var element in userChallenges.data!) {
        if (element.startAt != null &&
            lastest.startAt != null &&
            element.startAt!.isAfter(lastest.startAt!)) {
          lastest = element;
        }
      }
      return MResult.success(lastest);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
