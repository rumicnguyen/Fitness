import 'package:fitness_app/src/features/account/view/account_view.dart';
import 'package:fitness_app/src/features/activity/view/activity_view.dart';
import 'package:fitness_app/src/features/authentication/view/forgot_view.dart';
import 'package:fitness_app/src/features/authentication/view/signin_view.dart';
import 'package:fitness_app/src/features/authentication/view/signup_view.dart';
import 'package:fitness_app/src/features/challenge/view/challenge_view.dart';
import 'package:fitness_app/src/features/dashboard/view/dashboard_view.dart';
import 'package:fitness_app/src/features/filter_workout/view/filter_workout_view.dart';
import 'package:fitness_app/src/features/home/view/home_view.dart';
import 'package:fitness_app/src/features/intro/view/intro_view.dart';
import 'package:fitness_app/src/features/start_workout/view/start_workout_view.dart';
import 'package:fitness_app/src/features/workout/view/workout_view.dart';
import 'package:fitness_app/src/features/workout_detail/view/workout_detal.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/router/route_name.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(
    navigatorKey: AppCoordinator.navigatorKey,
    initialLocation: AppRouteNames.intro.path,
    debugLogDiagnostics: kDebugMode,
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: AppCoordinator.navigatorKey,
        path: AppRouteNames.intro.path,
        name: AppRouteNames.intro.name,
        builder: (_, __) => const IntroView(),
        routes: <RouteBase>[
          GoRoute(
            parentNavigatorKey: AppCoordinator.navigatorKey,
            path: AppRouteNames.signIn.subPath,
            name: AppRouteNames.signIn.name,
            builder: (_, __) => const SignInView(),
          ),
          GoRoute(
            parentNavigatorKey: AppCoordinator.navigatorKey,
            path: AppRouteNames.signUp.subPath,
            name: AppRouteNames.signUp.name,
            builder: (_, __) => const SignUpView(),
          ),
          GoRoute(
            parentNavigatorKey: AppCoordinator.navigatorKey,
            path: AppRouteNames.forgotPassword.subPath,
            name: AppRouteNames.forgotPassword.name,
            builder: (_, __) => const ForgotView(),
          ),
          // place to insert collect info route
        ],
      ),
      ShellRoute(
        navigatorKey: AppCoordinator.shellKey,
        builder: (context, state, child) => DashBoardScreen(
          body: child,
        ),
        routes: <RouteBase>[
          GoRoute(
            path: AppRouteNames.home.subPath,
            name: AppRouteNames.home.name,
            builder: (context, state) => const HomeView(),
          ),
          GoRoute(
            path: AppRouteNames.workout.path,
            name: AppRouteNames.workout.name,
            builder: (_, __) => const WorkoutView(),
            routes: <RouteBase>[
              GoRoute(
                path: AppRouteNames.filterWorkout.subPath,
                name: AppRouteNames.filterWorkout.name,
                builder: (context, state) {
                  return const FilterWorkoutView();
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRouteNames.challenge.path,
            name: AppRouteNames.challenge.name,
            builder: (_, __) => const ChallengeView(),
          ),
          GoRoute(
            path: AppRouteNames.account.path,
            name: AppRouteNames.account.name,
            builder: (_, __) => const AccountView(),
          ),
          GoRoute(
            path: AppRouteNames.activity.path,
            name: AppRouteNames.activity.name,
            builder: (_, __) => const ActivityView(),
          ),
          GoRoute(
            path: AppRouteNames.workoutDetails.path,
            name: AppRouteNames.workoutDetails.name,
            builder: (_, __) => const WorkoutDetailView(),
            routes: [
              GoRoute(
                parentNavigatorKey: AppCoordinator.navigatorKey,
                path: AppRouteNames.startWorkout.subPath,
                name: AppRouteNames.startWorkout.name,
                builder: (context, state) {
                  final id = state
                      .pathParameters[AppRouteNames.startWorkout.paramName]!;
                  return StartWorkoutView(
                    id: id,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
