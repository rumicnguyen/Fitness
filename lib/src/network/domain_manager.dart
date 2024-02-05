import 'package:fitness_app/src/network/data/activity/activity_detail_repository_impl.dart';
import 'package:fitness_app/src/network/data/activity/activity_repository_impl.dart';
import 'package:fitness_app/src/network/data/challenge/challenge_repository_impl.dart';
import 'package:fitness_app/src/network/data/exercise/exercise_repository_impl.dart';
import 'package:fitness_app/src/network/data/sign/sign_repository_impl.dart';
import 'package:fitness_app/src/network/data/user/user_repository_impl.dart';
import 'package:fitness_app/src/network/data/user_workout/user_workout_repository_impl.dart';
import 'package:fitness_app/src/network/data/workout/workout_repository_impl.dart';

class DomainManager {
  factory DomainManager() {
    _internal ??= DomainManager._();
    return _internal!;
  }
  DomainManager._();
  static DomainManager? _internal;

  final activityDetail = ActivityDetailRepositoryImpl();
  final workout = WorkoutRepositoryImpl();
  final user = UserRepositoryImpl();
  final userWorkout = UserWorkoutRepositoryImpl();
  final challenge = ChallengeRepositoryImpl();
  final activity = ActivityRepositoryImpl();
  final sign = SignRepositoryImpl();
  final exercise = ExerciseRepositoryImpl();
}
