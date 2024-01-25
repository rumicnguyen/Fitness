import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/data/enum/discipline_activity.dart';
import 'package:fitness_app/src/network/data/enum/entry_fee.dart';
import 'package:fitness_app/src/network/data/enum/time_filter.dart';
import 'package:fitness_app/src/network/data/enum/workout_level.dart';

class FilterWorkoutState extends Equatable {
  final DisciplineActivity disciplineActivity;
  final EntryFee entryFee;
  final TimeFilter time;
  final WorkoutLevel level;

  final DisciplineActivity disciplineActivityOnFilter;
  final EntryFee entryFeeOnFilter;
  final TimeFilter timeOnFilter;
  final WorkoutLevel levelOnFilter;
  const FilterWorkoutState({
    required this.disciplineActivity,
    required this.entryFee,
    required this.time,
    required this.level,
    required this.disciplineActivityOnFilter,
    required this.entryFeeOnFilter,
    required this.timeOnFilter,
    required this.levelOnFilter,
  });

  bool isApply(FilterWorkoutState filterWorkoutState) {
    return filterWorkoutState.disciplineActivity.value !=
            disciplineActivity.value ||
        filterWorkoutState.entryFee.value != entryFee.value ||
        filterWorkoutState.time.value != time.value ||
        filterWorkoutState.level.value != level.value;
  }

  factory FilterWorkoutState.ds() => const FilterWorkoutState(
        disciplineActivity: DisciplineActivity.any,
        entryFee: EntryFee.any,
        time: TimeFilter.any,
        level: WorkoutLevel.none,
        disciplineActivityOnFilter: DisciplineActivity.any,
        entryFeeOnFilter: EntryFee.any,
        timeOnFilter: TimeFilter.any,
        levelOnFilter: WorkoutLevel.none,
      );

  FilterWorkoutState copyWith({
    DisciplineActivity? disciplineActivity,
    EntryFee? entryFee,
    TimeFilter? time,
    WorkoutLevel? level,
    DisciplineActivity? disciplineActivityOnFilter,
    EntryFee? entryFeeOnFilter,
    TimeFilter? timeOnFilter,
    WorkoutLevel? levelOnFilter,
  }) {
    return FilterWorkoutState(
      disciplineActivity: disciplineActivity ?? this.disciplineActivity,
      entryFee: entryFee ?? this.entryFee,
      time: time ?? this.time,
      level: level ?? this.level,
      disciplineActivityOnFilter:
          disciplineActivityOnFilter ?? this.disciplineActivityOnFilter,
      entryFeeOnFilter: entryFeeOnFilter ?? this.entryFeeOnFilter,
      timeOnFilter: timeOnFilter ?? this.timeOnFilter,
      levelOnFilter: levelOnFilter ?? this.levelOnFilter,
    );
  }

  @override
  List<Object> get props {
    return [
      disciplineActivity,
      entryFee,
      time,
      level,
      disciplineActivityOnFilter,
      entryFeeOnFilter,
      timeOnFilter,
      levelOnFilter,
    ];
  }
}
