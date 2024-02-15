import 'package:fitness_app/src/network/data/challenge/challenge_reference.dart';
import 'package:fitness_app/src/network/data/challenge/challenge_repository.dart';
import 'package:fitness_app/src/network/model/challenge/challenge.dart';
import 'package:fitness_app/src/network/model/common/result.dart';

class ChallengeRepositoryImpl extends ChallengeRepository {
  final challengeRef = ChallengeReference();

  @override
  Future<MResult<MChallenge>> addChallenge({required MChallenge challenge}) {
    return challengeRef.addChallenge(challenge);
  }

  @override
  Future<MResult<MChallenge>> getChallengeById({required String id}) async {
    return challengeRef.get(id);
  }

  @override
  Future<MResult<List<MChallenge>>> getChallenges() async {
    return challengeRef.getChallenges();
  }

  @override
  Future<MResult<List<MChallenge>>> getActiveChallenges() async {
    try {
      MResult<List<MChallenge>> list = await getChallenges();

      List<MChallenge> data = [];
      if (list.isError || list.data == null) {
        return MResult.error('error');
      }
      for (var element in list.data!) {
        if (element.isActive == true) {
          data.add(element);
        }
      }
      return MResult.success(data);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
