import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/goal/goal.dart';

abstract class GoalRepository {
  Future<MResult<MGoal>> getGoal({required String id});
  Future<MResult<MGoal>> getGoalFrom({required String goal});
  Future<MResult<List<MGoal>>> getGoals();
}
