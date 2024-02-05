import 'package:fitness_app/src/features/start_workout/logic/start_workout_state.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/exercise/exercise.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:fitness_app/src/utils/exercise_sort.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class StartWorkoutBloc extends Cubit<StartWorkoutState> {
  StartWorkoutBloc(String id) : super(StartWorkoutState.ds()) {
    syncData(id);
  }
  DomainManager get domain => DomainManager();

  Future syncData(String id) async {
    emit(state.copyWith(handle: MHandle.loading()));
    final workout = await domain.workout.getWorkoutById(id: id);
    if (workout.isSuccess && workout.data != null) {
      onChangeWorkout(workout.data!);
      final videoId = YoutubePlayer.convertUrlToId(workout.data!.video);
      emit(state.copyWith(
        controller: YoutubePlayerController(
          initialVideoId: videoId ?? '',
          flags: const YoutubePlayerFlags(
            mute: false,
            autoPlay: false,
          ),
        ),
      ));
      final exercise =
          await domain.exercise.getExerciseOfWorkout(id: workout.data!.id);
      if (exercise.isSuccess && exercise.data != null) {
        onChangeExercise(exercise.data!);
      }
    }
    emit(state.copyWith(handle: MHandle.result(workout)));
  }

  void onChangeWorkout(MWorkout workout) {
    emit(state.copyWith(workout: workout));
  }

  void onChangeExercise(List<MExercise> exercise) {
    final List<MExercise> list = List.from(exercise);
    ExerciseSort.dataSort(list);
    emit(state.copyWith(exercise: list));
  }

  void onIncreaseTaskDone() {
    if ((state.countTaskDone - state.workout.exercises) < 0) {
      emit(state.copyWith(countTaskDone: state.countTaskDone + 1));
    }
  }

  void onIncreaseCurrent() {
    if ((state.current - state.workout.exercises) < 0) {
      emit(state.copyWith(countTaskDone: state.current + 1));
    }
  }

  void onChangeTaskDone(int index) {
    emit(state.copyWith(countTaskDone: index));
  }

  void onChangeCurrent(int current) {
    emit(state.copyWith(current: current));
  }
}
