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
    MResult<List<MWorkout>> list = await getWorkouts();
    if (list.isSuccess && list.data != null) {
      return MResult.success(list.data);
    }
    return MResult.error('error');
  }

  @override
  Future<MResult<MWorkout>> getWorkoutById({required String id}) async {
    MResult<List<MWorkout>> list = await getWorkouts();
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
  Future<MResult<List<MWorkout>>> getNewSessions() async {
    MResult<List<MWorkout>> list = await getWorkouts();
    if (list.isSuccess && list.data != null) {
      return MResult.success(list.data);
    }
    return MResult.error('error');
  }

  @override
  Future<MResult<List<MWorkout>>> getWorkouts() async {
    List<MWorkout> list = [
      MWorkout(
        id: '1',
        level: WorkoutLevel.medium,
        thumbnail: Assets.images.item1.path,
        backgroundImage: Assets.images.item1.path,
        members: 231,
        name: 'Get already to the marathon',
        exercises: 3,
        maximumTime: 30,
        minimumTime: 20,
      ),
      MWorkout(
        id: '3',
        level: WorkoutLevel.entry,
        thumbnail: Assets.images.item7.path,
        backgroundImage: Assets.images.item7.path,
        members: 200,
        name: 'Get already to the Next activity',
        tag: 2,
        exercises: 13,
        maximumTime: 50,
        minimumTime: 40,
      ),
      MWorkout(
        id: '2',
        level: WorkoutLevel.medium,
        thumbnail: Assets.images.item3.path,
        backgroundImage: Assets.images.item3.path,
        members: 68,
        name: 'How to improve your overall activity',
        exercises: 5,
        maximumTime: 30,
        minimumTime: 20,
      ),
      MWorkout(
        id: '4',
        level: WorkoutLevel.simple,
        thumbnail: Assets.images.newTransparent.path,
        backgroundImage: Assets.images.newBackground.path,
        members: 100,
        name: 'Workout with ball',
        exercises: 2,
        maximumTime: 20,
        minimumTime: 15,
      ),
      MWorkout(
        id: '5',
        level: WorkoutLevel.medium,
        thumbnail: Assets.images.item9.path,
        backgroundImage: Assets.images.item9.path,
        members: 304,
        name: 'Basketball',
        exercises: 3,
        maximumTime: 30,
        minimumTime: 20,
      ),
    ];

    return MResult.success(list);
  }
}
