import 'package:fitness_app/src/features/most_popular/logic/most_popular_state.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MostPopularBloc extends Cubit<MostPopularState> {
  MostPopularBloc() : super(MostPopularState.ds()) {
    syncData();
  }

  DomainManager get domain => DomainManager();
  FirebaseStorageReference get storage => FirebaseStorageReference();

  Future syncData() async {
    emit(state.copyWith(handle: MHandle.loading()));
    final result = await domain.workout.getWorkouts();
    if (result.isSuccess && result.data != null) {
      changeMostPopular(result.data!);
      List<String> list = [];
      for (var element in result.data!) {
        final img = await storage.get(
          folder: StorageFolder.workouts,
          data: element.thumbnail,
        );
        if (img.isSuccess && img.data != null) {
          list.add(img.data!);
        }
      }
      changeImages(list);
    }
    emit(state.copyWith(handle: MHandle.result(result)));
  }

  void changeImages(List<String> list) {
    List<String> data = List.from(list);
    emit(state.copyWith(images: data));
  }

  void changeMostPopular(List<MWorkout> list) {
    List<MWorkout> data = List.from(list);
    emit(state.copyWith(mostPopular: data));
  }
}
