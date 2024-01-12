import 'package:fitness_app/src/features/home/view/home_view.dart';
import 'package:fitness_app/src/router/route_name.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: AppRouteName.home.path,
    debugLogDiagnostics: kDebugMode,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouteName.home.path,
        name: AppRouteName.home.name,
        builder: (_, __) => const HomeView(),
        routes: const <RouteBase>[
          /* 
          /// Will be developed in other feature
          GoRoute(
            path: AppRouteName.home.subPath,
            name: AppRouteName.home.subPath,
            builder: (_, __) => const HomeView(),
          ),
          */
        ],
      ),
    ],
  );
}
