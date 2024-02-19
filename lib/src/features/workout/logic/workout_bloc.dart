import 'package:fitness_app/src/features/workout/logic/workout_state.dart';
import 'package:fitness_app/src/network/data/enum/tab_bar_workout.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutBloc extends Cubit<WorkoutState> {
  WorkoutBloc() : super(WorkoutState.ds()) {
    syncData();
  }

  void onChangedTab(TabBarWorkout tab) {
    emit(state.copyWith(currentTab: tab));
  }

  DomainManager get domain => DomainManager();

  Future syncData() async {
    final result = await domain.workout.getWorkouts();
    if (result.isSuccess && result.data != null) {
      changeNewSessions(result.data!);
    }
  }

  void changeNewSessions(List<MWorkout> list) {
    List<MWorkout> datas = List.from(list);
    emit(state.copyWith(newSessions: datas));
  }
}
