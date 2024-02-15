import 'package:fitness_app/src/network/data/goal/goal_reference.dart';
import 'package:fitness_app/src/network/data/goal/goal_repository.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/goal/goal.dart';

class GoalRepositoryImpl extends GoalRepository {
  final goalRef = GoalReference();
  @override
  Future<MResult<MGoal>> getGoal({required String id}) {
    return goalRef.get(id);
  }

  @override
  Future<MResult<List<MGoal>>> getGoals() {
    return goalRef.getGoals();
  }
  
  @override
  Future<MResult<MGoal>> getGoalFrom({required String goal}) {
    return goalRef.getGoalFrom(goal);
  }
}
