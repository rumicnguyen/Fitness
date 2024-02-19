import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';

class MostPopularState extends Equatable {
  final MHandle handle;
  final List<MWorkout> mostPopular;

  const MostPopularState({
    required this.handle,
    required this.mostPopular,

  });

  factory MostPopularState.ds() => MostPopularState(
        mostPopular: const [],
        handle: MHandle(),
      );

  MostPopularState copyWith({
    MHandle? handle,
    List<MWorkout>? mostPopular,
    List<String>? images,
  }) {
    return MostPopularState(
      handle: handle ?? this.handle,
      mostPopular: mostPopular ?? this.mostPopular,
    );
  }

  @override
  List<Object> get props => [handle, mostPopular];
}
