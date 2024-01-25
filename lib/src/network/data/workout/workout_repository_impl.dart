import 'package:fitness_app/gen/assets.gen.dart';
import 'package:fitness_app/src/network/data/enum/workout_level.dart';
import 'package:fitness_app/src/network/data/workout/workout_repository.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

class WorkoutRepositoryImpl extends WorkoutRepository {
  @override
  Future<MResult<MWorkout>> addWorkout({required MWorkout workout}) {
    // TODO: implement addWorkout
    throw UnimplementedError();
  }

  @override
  Future<MResult<List<MWorkout>>> getNextWorkoutsUser(
      {required String id}) async {
    List<MWorkout> list = [
      MWorkout(
        id: '1',
        level: WorkoutLevel.medium,
        thumbnail: Assets.images.item1.path,
        members: 231,
        name: 'Get already to the marathon',
      ),
      MWorkout(
        id: '3',
        level: WorkoutLevel.entry,
        thumbnail: Assets.images.item7.path,
        members: 200,
        name: 'Get already to the Next activity',
        tag: 2,
      ),
      MWorkout(
        id: '2',
        level: WorkoutLevel.medium,
        thumbnail: Assets.images.item3.path,
        members: 68,
        name: 'How to improve your overall activity',
      ),
      MWorkout(
        id: '4',
        level: WorkoutLevel.simple,
        thumbnail: Assets.images.item2.path,
        members: 100,
        name: 'Workout with ball',
      ),
      MWorkout(
        id: '5',
        level: WorkoutLevel.medium,
        thumbnail: Assets.images.item9.path,
        members: 304,
        name: 'Basketball',
      ),
    ];

    return MResult.success(list);
  }

  @override
  Future<MResult<MWorkout>> getWorkout({required String id}) {
    // TODO: implement getWorkout
    throw UnimplementedError();
  }

  @override
  Future<MResult<List<MWorkout>>> getNewSessions() async {
    List<MWorkout> list = [
      MWorkout(
        id: '2',
        level: WorkoutLevel.medium,
        thumbnail: Assets.images.item3.path,
        members: 68,
        name: 'How to improve your overall activity',
        exercises: 3,
      ),
      MWorkout(
        id: '4',
        level: WorkoutLevel.simple,
        thumbnail: Assets.images.item2.path,
        members: 100,
        name: 'Workout with ball',
        exercises: 12,
      ),
      MWorkout(
        id: '5',
        level: WorkoutLevel.medium,
        thumbnail: Assets.images.item9.path,
        members: 304,
        name: 'Basketball',
        exercises: 8,
      ),
    ];

    return MResult.success(list);
  }
}
