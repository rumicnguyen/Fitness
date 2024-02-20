import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/features/home/logic/home_state.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/activity/activity.dart';
import 'package:fitness_app/src/network/model/challenge/challenge.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/router/route_name.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState.ds()) {
    syncData();
  }

  DomainManager get domain => DomainManager();
  FirebaseStorageReference get storageRef => FirebaseStorageReference();
  final MUser user = UserPrefs.I.getUser() ?? MUser.empty();

  Future syncData() async {
    emit(state.copyWith(handle: MHandle.loading()));
    XToast.showLoading();

    if (user.id.isNotEmpty == true) {
      Future.wait([
        syncDataTodayActivity(user.id),
        syncDataNextWorkout(user.id),
        syncDataActiveChallenge(),
        syncDataPodcasts(),
        syncDataFriendsActivity(user.id),
        syncDataCurrentWorkout(user.id),
      ]);
    }

    XToast.hideLoading();
    emit(state.copyWith(handle: MHandle.completed(user)));
  }

  Future syncDataCurrentWorkout(String userId) async {
    final result =
        await domain.userWorkout.getLastestUserWorkout(userId: userId);
    if (result.isSuccess && result.data != null) {
      emit(state.copyWith(continueWorkout: result.data!));
    }
  }

  Future syncDataTodayActivity(String userId) async {
    final result = await domain.activity.getTodayActivityUser(userId: userId);
    if (result.isSuccess && result.data != null) {
      changeTodayActivity(result.data!);
    }
  }

  Future syncDataNextWorkout(String userId) async {
    final result = await domain.workout.getNextWorkoutsUser(id: userId);
    if (result.isSuccess && result.data != null) {
      changeNextWorkout(result.data!);
    }
  }

  Future syncDataActiveChallenge() async {
    final result = await domain.challenge.getActiveChallenges();
    if (result.isSuccess && result.data != null) {
      if (result.data!.isNotEmpty) {
        emit(state.copyWith(activeChallenge: result.data![0]));
      } else {
        emit(state.copyWith(activeChallenge: MChallenge.empty()));
      }
    }
  }

  Future syncDataPodcasts() async {
    final result = await domain.workout.getPodcasts();
    if (result.isSuccess && result.data != null) {
      changePodcasts(result.data!);
    }
  }

  Future syncDataFriendsActivity(String userId) async {
    final result = await domain.user.getFriendsActivity(id: userId);
    if (result.isSuccess && result.data != null) {
      changeFriendsActivity(result.data!);
    }
  }

  void changeNextWorkout(List<MWorkout> list) {
    List<MWorkout> data = List.from(list);
    emit(state.copyWith(nextWorkouts: data));
  }

  void changeTodayActivity(MActivity data) {
    emit(state.copyWith(todayActivity: data));
  }

  void changeActiveChallenge(MChallenge challenge) {
    emit(state.copyWith(activeChallenge: challenge));
  }

  void changePodcasts(List<MWorkout> list) {
    List<MWorkout> data = List.from(list);
    emit(state.copyWith(podcasts: data));
  }

  void changeFriendsActivity(List<MUserWorkout> list) {
    List<MUserWorkout> data = List.from(list);
    emit(state.copyWith(friendsActivity: data));
  }

  void onLogout() {
    emit(state.copyWith(handle: MHandle.loading()));
    XToast.showLoading();

    UserPrefs.I.clear();
    AppCoordinator.goNamed(AppRouteNames.signIn.name);

    XToast.hideLoading();
    emit(state.copyWith(handle: MHandle.completed(user)));
  }
}
