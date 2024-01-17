import 'package:fitness_app/src/router/route_name.dart';
import 'package:flutter/material.dart';

enum XNavigationBarItems {
  home(
    label: 'Home',
    route: AppRouteNames.home,
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
  ),
  workout(
    label: 'Workout',
    route: AppRouteNames.workout,
    icon: Icons.fitness_center_outlined,
    selectedIcon: Icons.home,
  ),
  challenge(
    label: 'Challenge',
    route: AppRouteNames.challenge,
    icon: Icons.emoji_events_outlined,
    selectedIcon: Icons.home,
  ),
  activity(
    label: 'Activity',
    route: AppRouteNames.activity,
    icon: Icons.local_fire_department_outlined,
    selectedIcon: Icons.home,
  ),
  account(
    label: 'Account',
    route: AppRouteNames.account,
    icon: Icons.people_outline,
    selectedIcon: Icons.people,
  );

  const XNavigationBarItems({
    required this.label,
    required this.route,
    required this.icon,
    this.selectedIcon,
  });

  final String label;
  final AppRouteNames route;
  final IconData icon;
  final IconData? selectedIcon;

  static XNavigationBarItems fromLocation(String location) {
    if (location == XNavigationBarItems.home.route.name) {
      return XNavigationBarItems.home;
    }

    return XNavigationBarItems.home;
  }
}
