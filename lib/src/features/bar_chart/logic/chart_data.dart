import 'package:fitness_app/src/features/bar_chart/logic/time_data.dart';

class ChartData {
  ChartData({
    required this.time,
    required this.value,
  });
  final TimeData time;
  final double value;
}
