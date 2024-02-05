import 'package:fitness_app/src/features/workout/logic/workout_card_state.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutCardBloc extends Cubit<WorkoutCardState> {
  WorkoutCardBloc(List<MWorkout> list) : super(WorkoutCardState.ds()) {
    syncData(list);
  }

  FirebaseStorageReference get ref => FirebaseStorageReference();

  Future syncData(List<MWorkout> list) async {
    emit(state.copyWith(handle: MHandle.loading()));
    List<String> result = List.from(state.listImage);
    for (var element in list) {
      final image = await ref.get(
          folder: StorageFolder.workouts, data: element.thumbnail);
      if (image.isSuccess && image.data != null) {
        result.add(image.data!);
      }
    }
    emit(state.copyWith(
      handle: MHandle.result(result as MResult),
      listImage: result,
    ));
  }
}
