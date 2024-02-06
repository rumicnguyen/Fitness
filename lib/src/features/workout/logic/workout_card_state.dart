import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/model/common/handle.dart';

class WorkoutCardState extends Equatable {
  final List<String> listImage;
  final MHandle handle;
  const WorkoutCardState({
    required this.listImage,
    required this.handle,
  });

  factory WorkoutCardState.ds() => WorkoutCardState(
        listImage: const [],
        handle: MHandle(),
      );

  WorkoutCardState copyWith({
    List<String>? listImage,
    MHandle? handle,
  }) {
    return WorkoutCardState(
      listImage: listImage ?? this.listImage,
      handle: handle ?? this.handle,
    );
  }

  @override
  List<Object> get props => [listImage, handle];
}
