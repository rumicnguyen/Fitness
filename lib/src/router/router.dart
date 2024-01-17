import 'package:fitness_app/src/features/authentication/view/forgot_view.dart';
import 'package:fitness_app/src/features/authentication/view/signin_view.dart';
import 'package:fitness_app/src/features/authentication/view/signup_view.dart';
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
    initialLocation: AppRouteNames.home.path,
    navigatorKey: AppCoordinator.navigatorKey,
    debugLogDiagnostics: kDebugMode,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouteNames.home.path,
        name: AppRouteNames.home.name,
        builder: (_, __) => const HomeView(),
        routes: <RouteBase>[
          GoRoute(
            parentNavigatorKey: AppCoordinator.navigatorKey,
            path: AppRouteNames.intro.subPath,
            name: AppRouteNames.intro.name,
            builder: (_, __) => const IntroView(),
          ),
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
          GoRoute(
            parentNavigatorKey: AppCoordinator.navigatorKey,
            path: AppRouteNames.workout.subPath,
            name: AppRouteNames.workout.name,
            builder: (_, __) => const WorkoutView(),
          ),
          GoRoute(
            parentNavigatorKey: AppCoordinator.navigatorKey,
            path: AppRouteNames.workoutDetails.subPath,
            name: AppRouteNames.workoutDetails.name,
            builder: (_, __) => const WorkoutDetailView(),
          ),
          GoRoute(
            parentNavigatorKey: AppCoordinator.navigatorKey,
            path: AppRouteNames.startWorkout.subPath,
            name: AppRouteNames.startWorkout.name,
            builder: (_, state) {
              final id =
                  state.pathParameters[AppRouteNames.startWorkout.paramName]!;
              return StartWorkoutView(
                id: id,
              );
            },
          ),
        ],
      ),
    ],
  );
}
