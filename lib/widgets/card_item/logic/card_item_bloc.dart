import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/widgets/card_item/logic/card_item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardItemBloc extends Cubit<CardItemState> {
  CardItemBloc(String image) : super(CardItemState.ds()) {
    syncData(image);
  }
  final ref = FirebaseStorageReference();
  DomainManager get domain => DomainManager();

  Future syncData(String image) async {
    emit(state.copyWith(handle: MHandle.loading()));

    final result = await ref.get(
      data: image,
      folder: StorageFolder.workouts,
    );
    if (result.isSuccess && result.data != null) {
      onChangeImage(result.data!);
    }

    emit(state.copyWith(handle: MHandle.result(result)));
  }

  void onChangeImage(String image) {
    emit(state.copyWith(thumbnail: image));
  }
}
