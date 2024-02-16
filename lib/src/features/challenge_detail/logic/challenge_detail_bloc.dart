import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/features/challenge_detail/logic/challenge_detail_state.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChallengeDetailBloc extends Cubit<ChallengeDetailState> {
  ChallengeDetailBloc(String id) : super(ChallengeDetailState.ds()) {
    syncData(id);
  }

  DomainManager get domain => DomainManager();

  Future syncData(String id) async {
    emit(state.copyWith(handle: MHandle.loading()));
    XToast.showLoading();
    final challenge = await domain.challenge.getChallengeById(id: id);
    if (challenge.isSuccess && challenge.data != null) {
      emit(state.copyWith(challenge: challenge.data!));
      var workouts = <MWorkout>[];
      for (var element in challenge.data!.workouts) {
        final result = await domain.workout.getWorkoutById(id: element);
        if (result.isSuccess && result.data != null) {
          workouts.add(result.data!);
        }
      }
      emit(state.copyWith(workouts: workouts));
    }
    emit(state.copyWith(handle: MHandle.result(challenge)));
    XToast.hideLoading();
  }

  void onChangeWorkouts(List<MWorkout> workouts) {
    emit(state.copyWith(workouts: workouts));
  }
}
