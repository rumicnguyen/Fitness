import 'package:fitness_app/src/network/model/exercise/exercise.dart';

class ExerciseSort {
  static void dataSort(List<MExercise> times) {
    quickSort(times, 0, times.length - 1);
  }

  static void quickSort(List<MExercise> arr, int low, int high) {
    if (low < high) {
      int pivotIndex = partition(arr, low, high);

      quickSort(arr, low, pivotIndex - 1);
      quickSort(arr, pivotIndex + 1, high);
    }
  }

  static int partition(List<MExercise> arr, int low, int high) {
    int pivotTime = arr[high].endAt;
    int i = low - 1;

    for (int j = low; j < high; j++) {
      if (arr[j].endAt <= pivotTime) {
        i++;
        swap(arr, i, j);
      }
    }

    swap(arr, i + 1, high);
    return i + 1;
  }

  static void swap(List<MExercise> arr, int i, int j) {
    MExercise temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}
