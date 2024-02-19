import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/data/enum/discipline_activity.dart';
import 'package:fitness_app/src/network/data/enum/entry_fee.dart';
import 'package:fitness_app/src/network/data/enum/time_filter.dart';
import 'package:fitness_app/src/network/data/enum/workout_level.dart';

class MFilterWorkout extends Equatable {
  const MFilterWorkout({
    required this.discipline,
    required this.entryFee,
    required this.time,
    required this.level,
  });

  final DisciplineActivity discipline;
  final EntryFee entryFee;
  final TimeFilter time;
  final WorkoutLevel level;

  factory MFilterWorkout.empty() {
    return const MFilterWorkout(
      discipline: DisciplineActivity.any,
      entryFee: EntryFee.any,
      time: TimeFilter.any,
      level: WorkoutLevel.any,
    );
  }

  factory MFilterWorkout.fromJson(Map<String, Object?> json) {
    return MFilterWorkout(
      discipline: json['discipline'] as DisciplineActivity,
      entryFee: json['entryFee'] as EntryFee,
      time: json['time'] as TimeFilter,
      level: json['level'] as WorkoutLevel,
    );
  }

  MFilterWorkout copyWith({
    DisciplineActivity? discipline,
    EntryFee? entryFee,
    TimeFilter? time,
    WorkoutLevel? level,
  }) {
    return MFilterWorkout(
      discipline: discipline ?? this.discipline,
      entryFee: entryFee ?? this.entryFee,
      time: time ?? this.time,
      level: level ?? this.level,
    );
  }

  @override
  String toString() {
    return 'MFilterWorkout(discipline: $discipline, entryFee: $entryFee, time: $time, level: $level)';
  }
  

  @override
  List<Object> get props => [discipline, entryFee, time, level];
}
