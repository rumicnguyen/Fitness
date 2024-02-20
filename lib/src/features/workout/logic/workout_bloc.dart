import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/features/workout/logic/workout_state.dart';
import 'package:fitness_app/src/network/data/enum/tab_bar_workout.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutBloc extends Cubit<WorkoutState> {
  WorkoutBloc() : super(WorkoutState.ds()) {
    syncData();
  }

  DomainManager get domain => DomainManager();
  final MUser user = UserPrefs.I.getUser() ?? MUser.empty();

  void onChangedTab(TabBarWorkout tab) {
    emit(state.copyWith(currentTab: tab));
  }

  Future syncData() async {
    emit(state.copyWith(handle: MHandle.loading()));
    XToast.showLoading();

    Future.wait([
      changeNewSessions(),
      changeRecommend(),
      syncDataCurrentWorkout(),
    ]);

    XToast.hideLoading();
    emit(state.copyWith(handle: MHandle.completed('')));
  }

  Future changeNewSessions() async {
    final result = await domain.workout.getNewSessions();
    if (result.isSuccess && result.data != null) {
      emit(state.copyWith(newSessions: result.data!));
    }
  }

  Future changeRecommend() async {
    final result = await domain.workout.getRecommendedWorkoutsUser(id: user.id);
    if (result.isSuccess && result.data != null) {
      emit(state.copyWith(recommended: result.data!));
    }
  }

  Future syncDataCurrentWorkout() async {
    final result =
        await domain.userWorkout.getLastestUserWorkout(userId: user.id);
    if (result.isSuccess && result.data != null) {
      emit(state.copyWith(continueWorkout: result.data!));
    }
  }
}
