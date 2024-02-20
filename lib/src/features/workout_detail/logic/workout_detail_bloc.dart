import 'package:fitness_app/src/features/workout_detail/logic/workout_detail_state.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:fitness_app/src/utils/string_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutDetailBloc extends Cubit<WorkoutDetailState> {
  WorkoutDetailBloc(String id) : super(WorkoutDetailState.ds()) {
    syncData(id);
  }
  final ref = FirebaseStorageReference();
  DomainManager get domain => DomainManager();

  Future syncData(String id) async {
    emit(state.copyWith(handle: MHandle.loading()));
    final workout = await domain.workout.getWorkoutById(id: id);
    if (workout.isSuccess && workout.data != null) {
      emit(state.copyWith(workout: workout.data));
      final result = await ref.get(
        data: workout.data!.backgroundImage,
        folder: StorageFolder.workouts,
      );
      if (result.isSuccess && result.data != null) {
        onChangeBackgroundImage(result.data!);
      }

      final user = UserPrefs.I.getUser();
      if (user != null && user.favoriteWorkout.contains(workout.data!.id)) {
        emit(state.copyWith(isFavorite: true));
      }
    }

    emit(state.copyWith(handle: MHandle.result(workout)));
  }

  void onChangeWorkout(MWorkout workout) {
    emit(state.copyWith(workout: workout));
  }

  Future onChangeFavorite() async {
    emit(state.copyWith(handle: MHandle.loading()));
    final bool isFavorited = state.isFavorite;
    final user = UserPrefs.I.getUser();
    if (user != null) {
      final result = await domain.user.updateFavoriteWorkout(
        user: user,
        workoutId: state.workout.id,
      );
      if (result.isSuccess) {
        emit(state.copyWith(
          isFavorite: !isFavorited,
          handle: MHandle.result(result),
        ));
      }
    } else {
      emit(state.copyWith(handle: MHandle.error('User not found')));
    }
  }

  void onChangeBackgroundImage(String image) {
    emit(state.copyWith(backgroundImage: image));
  }

  Future onStartWorkout() async {
    emit(state.copyWith(handle: MHandle.loading()));
    final user = UserPrefs.I.getUser();
    final MUserWorkout userWorkout = MUserWorkout(
      id: StringUtils.generateId(),
      startAt: DateTime.now(),
      workoutId: state.workout.id,
      taskDone: 0,
      workoutImage: state.workout.thumbnail,
      workoutName: state.workout.name,
      userName: user?.name ?? '',
      userId: user?.id ?? '',
    );
    final result =
        await domain.userWorkout.getUpdateOrAddUserWorkout(userWorkout);

    if (result.isSuccess && result.data != null) {
      emit(state.copyWith(handle: MHandle.result(result)));
      AppCoordinator.showStartWorkoutScreen(id: state.workout.id);
    } else {
      emit(state.copyWith(handle: MHandle.error(S.text.error)));
    }
  }
}
