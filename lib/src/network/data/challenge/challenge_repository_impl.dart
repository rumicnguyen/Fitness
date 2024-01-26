import 'package:fitness_app/gen/assets.gen.dart';
import 'package:fitness_app/src/network/data/challenge/challenge_repository.dart';
import 'package:fitness_app/src/network/data/enum/workout_level.dart';
import 'package:fitness_app/src/network/model/challenge/challenge.dart';
import 'package:fitness_app/src/network/model/common/result.dart';

class ChallengeRepositoryImpl extends ChallengeRepository {
  @override
  Future<MResult<MChallenge>> addChallenge({required MChallenge challenge}) {
    // TODO: implement addChallenge
    throw UnimplementedError();
  }

  @override
  Future<MResult<MChallenge>> getChallengeById({required String id}) async {
    MResult<List<MChallenge>> list = await getChallenges();
    if (list.isSuccess && list.data != null) {
      for (var element in list.data!) {
        if (element.id == id) {
          return MResult.success(element);
        }
      }
    }
    return MResult.error('error');
  }

  @override
  Future<MResult<List<MChallenge>>> getChallenges() async {
    try {
      List<MChallenge> list = [
        MChallenge(
          id: '1',
          level: WorkoutLevel.medium,
          thumbnail: Assets.images.item1.path,
          members: 231,
          name: 'Get already to the marathon',
        ),
        MChallenge(
          id: '2',
          level: WorkoutLevel.medium,
          thumbnail: Assets.images.item3.path,
          members: 68,
          name: 'How to improve your overall activity',
          isActive: false,
        ),
        MChallenge(
          id: '3',
          level: WorkoutLevel.entry,
          thumbnail: Assets.images.item7.path,
          members: 200,
          name: 'Get already to the Next activity',
          tag: 2,
        ),
        MChallenge(
          id: '4',
          level: WorkoutLevel.simple,
          thumbnail: Assets.images.newTransparent.path,
          members: 100,
          name: 'Workout with ball',
          tag: 3,
        ),
        MChallenge(
          id: '5',
          level: WorkoutLevel.medium,
          thumbnail: Assets.images.item9.path,
          members: 304,
          name: 'Basketball',
          tag: 1,
        ),
      ];

      // check when fetch data
      // if (list == null) {
      //   return MResult.error('error');
      // }
      return MResult.success(list);
    } catch (e) {
      return MResult.exception(e);
    }
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
