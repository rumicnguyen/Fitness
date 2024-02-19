import 'package:flutter/material.dart';

enum StatsType {
  daysRunning(
    label: 'Days Running',
    icon: Icons.calendar_month,
  ),
  kilometresRun(
    label: 'Kilometres Run',
    icon: Icons.directions_run,
  ),
  tasksCompleted(
    label: 'Tasks Completed',
    icon: Icons.check_circle_outline,
  ),
  averageHeartRate(
    label: 'Average Heart Rate',
    icon: Icons.error,
  ),
  kilocaloriesBurned(
    label: 'Kilocalories Burned',
    icon: Icons.local_fire_department_outlined,
  ),
  ;

  final String label;
  final IconData icon;
  const StatsType({required this.label, required this.icon});
}
