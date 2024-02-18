import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/features/most_popular/logic/most_popular_state.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MostPopularBloc extends Cubit<MostPopularState> {
  MostPopularBloc() : super(MostPopularState.ds()) {
    syncData();
  }

  DomainManager get domain => DomainManager();
  FirebaseStorageReference get storage => FirebaseStorageReference();

  Future syncData() async {
    emit(state.copyWith(handle: MHandle.loading()));
    XToast.showLoading();

    Future.wait([
      domain.workout.updateMostPopular(),
      changeMostPopular(),
    ]);

    XToast.hideLoading();
    emit(state.copyWith(handle: MHandle.completed('')));
  }

  Future changeMostPopular() async {
    final result = await domain.workout.getMostPopular();
    if (result.isSuccess && result.data != null) {
      emit(state.copyWith(mostPopular: result.data!));
    }
  }
}
