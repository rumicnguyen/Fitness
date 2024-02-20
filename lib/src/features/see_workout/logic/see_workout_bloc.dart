import 'package:fitness_app/src/features/see_workout/logic/see_workout_state.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/filter_workout/filter_workout.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeWorkoutBloc extends Cubit<SeeWorkoutState> {
  SeeWorkoutBloc(MFilterWorkout? filterWorkout) : super(SeeWorkoutState.ds()) {
    syncData(filterWorkout);
  }

  DomainManager get domain => DomainManager();

  Future syncData(MFilterWorkout? filterWorkout) async {
    emit(state.copyWith(handle: MHandle.loading()));
    late MResult<List<MWorkout>> workout;
    if (filterWorkout == null) {
      workout = await domain.workout.getWorkouts();
    } else {
      workout = await domain.workout.getFilterWorkout(
        filterWorkout: filterWorkout,
      );
    }
    if (workout.isSuccess && workout.data != null) {
      onChangeWorkouts(workout.data!);
    }
    emit(state.copyWith(handle: MHandle.result(workout)));
  }

  void onChangeWorkouts(List<MWorkout> workouts) {
    emit(state.copyWith(workouts: workouts));
  }
}
