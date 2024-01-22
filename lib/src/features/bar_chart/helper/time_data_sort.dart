import 'package:fitness_app/src/features/bar_chart/logic/chart_data.dart';

void dataSort(List<ChartData> times) {
  quickSort(times, 0, times.length - 1);
}

void quickSort(List<ChartData> arr, int low, int high) {
  if (low < high) {
    int pivotIndex = partition(arr, low, high);

    quickSort(arr, low, pivotIndex - 1);
    quickSort(arr, pivotIndex + 1, high);
  }
}

int partition(List<ChartData> arr, int low, int high) {
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

void swap(List<ChartData> arr, int i, int j) {
  ChartData temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}
