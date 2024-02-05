import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

class WorkoutDetailState extends Equatable {
  final MWorkout workout;
  final bool isFavorite;
  final String backgroundImage;
  final MHandle handle;
  const WorkoutDetailState({
    required this.workout,
    required this.isFavorite,
    required this.backgroundImage,
    required this.handle
  });
  factory WorkoutDetailState.ds() => WorkoutDetailState(
        workout: MWorkout.empty(),
        isFavorite: false,
        backgroundImage: '',
        handle: MHandle()
      );

  WorkoutDetailState copyWith({
    MWorkout? workout,
    bool? isFavorite,
    String? backgroundImage,
    MHandle? handle,
  }) {
    return WorkoutDetailState(
      workout: workout ?? this.workout,
      isFavorite: isFavorite ?? this.isFavorite,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      handle: handle ?? this.handle,
    );
  }

  @override
  List<Object> get props => [workout, isFavorite, backgroundImage, handle];
}
