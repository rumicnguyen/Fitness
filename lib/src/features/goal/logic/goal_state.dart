import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/goal/goal.dart';

class GoalState extends Equatable {
  final MHandle handle;
  final List<MGoal> goals;
  final List<MGoal> listGoal;
  const GoalState({
    required this.handle,
    required this.goals,
    required this.listGoal,
  });

  factory GoalState.ds() => GoalState(
        handle: MHandle(),
        goals: const [],
        listGoal: const [],
      );

  GoalState copyWith({
    MHandle? handle,
    List<MGoal>? goals,
    List<MGoal>? listGoal,
  }) {
    return GoalState(
      handle: handle ?? this.handle,
      goals: goals ?? this.goals,
      listGoal: listGoal ?? this.listGoal,
    );
  }

  @override
  List<Object> get props => [handle, goals, listGoal];
}
