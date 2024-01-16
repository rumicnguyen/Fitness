import 'package:fitness_app/src/features/home/view/home_view.dart';
import 'package:fitness_app/src/features/intro/view/intro_view.dart';

import 'package:fitness_app/src/router/route_name.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: AppRouteName.intro.path,
    debugLogDiagnostics: kDebugMode,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouteName.intro.path,
        name: AppRouteName.intro.name,
        builder: (_, __) => const IntroView(),
        routes: <RouteBase>[
          GoRoute(
            path: AppRouteName.home.subPath,
            name: AppRouteName.home.subPath,
            builder: (_, __) => const HomeView(),
          ),
        ],
      ),
    ],
  );
}
