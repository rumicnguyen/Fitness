import 'package:fitness_app/src/features/home/logic/next_workout_state.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextWorkoutBloc extends Cubit<NextWorkoutState> {
  NextWorkoutBloc() : super(NextWorkoutState.ds()) {
    syncData();
  }

  DomainManager get domain => DomainManager();

  Future syncData() async {
    const String id = 'userId';
    if (id.isNotEmpty == true) {
      final result = await domain.workout.getNextWorkoutsUser(id: id);
      if (result.isSuccess && result.data != null) {
        changeList(result.data!);
      }
    }
  }

  void changeList(List<MWorkout> list) {
    List<MWorkout> datas = List.from(list);
    emit(state.copyWith(workouts: datas));
  }
}
