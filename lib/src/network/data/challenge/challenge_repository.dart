import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/challenge/challenge.dart';

abstract class ChallengeRepository {
  Future<MResult<MChallenge>> getChallengeById({required String id});
  Future<MResult<List<MChallenge>>> getChallenges();
  Future<MResult<MChallenge>> addChallenge({required MChallenge challenge});
  Future<MResult<List<MChallenge>>> getActiveChallenges();
}
