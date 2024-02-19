import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

class PopularUtils {
  static final domain = DomainManager();

  static Future<MResult<int>> getCoreFavorite(
    String workoutId,
  ) async {
    try {
      final users = await domain.user.getUsers();
      int result = 0;
      if (users.isSuccess && users.data != null) {
        for (var element in users.data!) {
          if (element.favoriteWorkout.contains(workoutId)) {
            result++;
          }
        }
        return MResult.success(result);
      }
      return MResult.error('error');
    } catch (e) {
      return MResult.exception(e);
    }
  }

  static Future<MResult<(int, int)>> getCoreFinishedAndStart(
    String workoutId,
  ) async {
    try {
      final userWorkout = await domain.userWorkout
          .getUserWorkoutByWorkoutId(workoutId: workoutId);

      int finished = 0;
      int start = 0;
      if (userWorkout.isSuccess && userWorkout.data != null) {
        for (var element in userWorkout.data!) {
          if (element.isFinished) {
            finished++;
          }
          start++;
        }
        return MResult.success((finished, start));
      }
      return MResult.error('error');
    } catch (e) {
      return MResult.exception(e);
    }
  }

  static Future<MResult<double>> popularCoreOf(String workoutId) async {
    try {
      final favoriteCore = await getCoreFavorite(workoutId);
      final finishedAndStartCore = await getCoreFinishedAndStart(workoutId);

      if (favoriteCore.isSuccess &&
          finishedAndStartCore.isSuccess &&
          favoriteCore.data != null &&
          finishedAndStartCore.data != null) {
        return MResult.success(favoriteCore.data! * 1.5 +
            finishedAndStartCore.data!.$1 * 2.0 +
            finishedAndStartCore.data!.$2 * 1.0);
      }
      return MResult.error('error');
    } catch (e) {
      return MResult.exception(e);
    }
  }

  static void dataSort(List<MWorkout> workouts) {
    quickSort(workouts, 0, workouts.length - 1);
  }

  static void quickSort(List<MWorkout> arr, int low, int high) {
    if (low < high) {
      int pivotIndex = partition(arr, low, high);

      quickSort(arr, low, pivotIndex - 1);
      quickSort(arr, pivotIndex + 1, high);
    }
  }

  static int partition(List<MWorkout> arr, int low, int high) {
    double pivotPopular = arr[high].popular;
    int i = low - 1;

    for (int j = low; j < high; j++) {
      if (arr[j].popular >= pivotPopular) {
        i++;
        swap(arr, i, j);
      }
    }

    swap(arr, i + 1, high);
    return i + 1;
  }

  static void swap(List<MWorkout> arr, int i, int j) {
    MWorkout temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}
