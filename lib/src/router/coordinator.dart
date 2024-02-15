import 'package:fitness_app/src/network/model/filter_workout/filter_workout.dart';
import 'package:fitness_app/src/router/route_name.dart';
import 'package:fitness_app/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class AppCoordinator {
  static AppRouter get rootRouter => GetIt.I<AppRouter>();
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final shellKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentState!.context;

  static void pop<T extends Object?>([T? result]) => context.pop(result);

  static void goNamed(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) =>
      context.goNamed(
        name,
        pathParameters: params,
        queryParameters: queryParams,
        extra: extra,
      );

  static void showHomeScreen() => context.goNamed(AppRouteNames.home.name);

  static void showIntroScreen() => context.goNamed(AppRouteNames.intro.name);

  static Future<T?> showSignInScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.signIn.name);

  static Future<T?> showSignUpScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.signUp.name);

  static Future<T?> showForgotPasswordScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.forgotPassword.name);

  static Future<T?> showSetGoalScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.setGoal.name);

  static Future<T?> showActivityScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.activity.name);

  static Future<T?> showWorkoutScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.workout.name);

  static Future<T?> showFilterWorkoutScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.filterWorkout.name);

  static Future<T?> showChallengeScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.challenge.name);

  static Future<T?> showWorkoutListScreen<T extends Object?>({
    MFilterWorkout? filterWorkout,
  }) =>
      context.pushNamed<T>(
        AppRouteNames.listWorkout.name,
        extra: filterWorkout,
      );

  static Future<T?> showAccountScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.account.name);

  static Future<T?> showWorkoutDetailsScreen<T extends Object?>(
          {required String id}) =>
      context.pushNamed<T>(
        AppRouteNames.workoutDetails.name,
        pathParameters: {AppRouteNames.workoutDetails.paramName!: id},
      );

  static Future<T?> showChallengeDetailsScreen<T extends Object?>(
          {required String id}) =>
      context.pushNamed<T>(
        AppRouteNames.challengeDetails.name,
        pathParameters: {AppRouteNames.challengeDetails.paramName!: id},
      );

  static Future<T?> showStartWorkoutScreen<T extends Object?>(
          {required String id}) =>
      context.pushNamed<T>(
        AppRouteNames.startWorkout.name,
        pathParameters: {AppRouteNames.startWorkout.paramName!: id},
      );
}
