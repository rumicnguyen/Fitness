import 'package:fitness_app/src/network/model/activity/activity_detail/activity_detail.dart';

class TimeDataSort {
  static void dataSort(List<MActivityDetail> times) {
    quickSort(times, 0, times.length - 1);
  }

  static void quickSort(List<MActivityDetail> arr, int low, int high) {
    if (low < high) {
      int pivotIndex = partition(arr, low, high);

      quickSort(arr, low, pivotIndex - 1);
      quickSort(arr, pivotIndex + 1, high);
    }
  }

  static int partition(List<MActivityDetail> arr, int low, int high) {
    int pivotTime = arr[high].time.value;
    int i = low - 1;

    for (int j = low; j < high; j++) {
      if (arr[j].time.value <= pivotTime) {
        i++;
        swap(arr, i, j);
      }
    }

    swap(arr, i + 1, high);
    return i + 1;
  }

  static void swap(List<MActivityDetail> arr, int i, int j) {
    MActivityDetail temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}
