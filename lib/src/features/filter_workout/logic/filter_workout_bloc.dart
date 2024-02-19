import 'package:fitness_app/src/features/filter_workout/logic/filter_workout_state.dart';
import 'package:fitness_app/src/network/data/enum/discipline_activity.dart';
import 'package:fitness_app/src/network/data/enum/entry_fee.dart';
import 'package:fitness_app/src/network/data/enum/time_filter.dart';
import 'package:fitness_app/src/network/data/enum/workout_level.dart';
import 'package:fitness_app/src/network/model/filter_workout/filter_workout.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterWorkoutBloc extends Cubit<FilterWorkoutState> {
  FilterWorkoutBloc() : super(FilterWorkoutState.ds());

  void resetAll() {
    emit(state.copyWith(
      disciplineActivityOnFilter: state.disciplineActivity,
      entryFeeOnFilter: state.entryFee,
      timeOnFilter: state.time,
      levelOnFilter: state.level,
    ));
  }

  void apply() {
    emit(state.copyWith(
      disciplineActivity: state.disciplineActivityOnFilter,
      entryFee: state.entryFeeOnFilter,
      time: state.timeOnFilter,
      level: state.levelOnFilter,
    ));

    AppCoordinator.showWorkoutListScreen(
        filterWorkout: MFilterWorkout(
      discipline: state.disciplineActivityOnFilter,
      entryFee: state.entryFeeOnFilter,
      time: state.timeOnFilter,
      level: state.levelOnFilter,
    ));
  }

  void setDisciplineActivityOnFilter(
      DisciplineActivity disciplineActivityOnFilter) {
    emit(state.copyWith(
      disciplineActivityOnFilter: disciplineActivityOnFilter,
    ));
  }

  void setEntryFeeOnFilter(EntryFee entryFeeOnFilter) {
    emit(state.copyWith(
      entryFeeOnFilter: entryFeeOnFilter,
    ));
  }

  void setTimeOnFilter(TimeFilter timeOnFilter) {
    emit(state.copyWith(
      timeOnFilter: timeOnFilter,
    ));
  }

  void setLevelOnFilter(WorkoutLevel levelOnFilter) {
    emit(state.copyWith(
      levelOnFilter: levelOnFilter,
    ));
  }

  void resetDisciplineActivityOnFilter() {
    emit(state.copyWith(
      disciplineActivityOnFilter: state.disciplineActivity,
    ));
  }

  void resetEntryFeeOnFilter() {
    emit(state.copyWith(
      entryFeeOnFilter: state.entryFee,
    ));
  }

  void resetTimeOnFilter() {
    emit(state.copyWith(
      timeOnFilter: state.time,
    ));
  }

  void resetLevelOnFilter() {
    emit(state.copyWith(
      levelOnFilter: state.level,
    ));
  }
}
