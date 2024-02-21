import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user_challenge/user_challenge.dart';

abstract class UserChallengeRepository {
  Future<MResult<MUserChallenge>> getLastestUserChallenge({required String userId});
  Future<MResult<MUserChallenge>> getUserChallengeById({required String id});
  Future<MResult<List<MUserChallenge>>> getUserChallengeByUserId({
    required String userId,
  });
  Future<MResult<List<MUserChallenge>>> getUserChallengeByChallengeId({
    required String challengeId,
  });

  Future<MResult<List<MUserChallenge>>> getUserChallenges();
  Future<MResult<MUserChallenge>> getUpdateOrAddUserChallenge(
    MUserChallenge userChallenge,
  );
  Future<MResult<MUserChallenge>> addUserChallenge({
    required MUserChallenge userChallenge,
  });
  Future<MResult<MUserChallenge>> update({
    required MUserChallenge userChallenge,
    bool? isFinished,
    DateTime? finishAt,
    DateTime? startAt,
  });
}
