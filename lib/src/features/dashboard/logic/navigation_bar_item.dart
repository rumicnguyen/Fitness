import 'package:fitness_app/src/router/route_name.dart';
import 'package:flutter/material.dart';

enum XNavigationBarItems {
  home(
    label: 'Home',
    route: AppRouteNames.home,
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
    selectedIndex: 0,
  ),
  workout(
    label: 'Workout',
    route: AppRouteNames.workout,
    icon: Icons.fitness_center_outlined,
    selectedIcon: Icons.fitness_center,
    selectedIndex: 1,
  ),
  challenge(
    label: 'Challenge',
    route: AppRouteNames.challenge,
    icon: Icons.emoji_events_outlined,
    selectedIcon: Icons.emoji_events,
    selectedIndex: 2,
  ),
  activity(
    label: 'Activity',
    route: AppRouteNames.activity,
    icon: Icons.local_fire_department_outlined,
    selectedIcon: Icons.local_fire_department,
    selectedIndex: 3,
  ),
  account(
    label: 'Account',
    route: AppRouteNames.account,
    icon: Icons.people_outline,
    selectedIcon: Icons.people,
    selectedIndex: 4,
  );

  const XNavigationBarItems({
    required this.label,
    required this.route,
    required this.icon,
    this.selectedIcon,
    required this.selectedIndex,
  });

  final String label;
  final AppRouteNames route;
  final IconData icon;
  final IconData? selectedIcon;
  final int selectedIndex;

  // static XNavigationBarItems fromLocation(String location) {
  //   if (location == XNavigationBarItems.home.route.name) {
  //     return XNavigationBarItems.home;
  //   }
  //   return XNavigationBarItems.home;
  // }

  static XNavigationBarItems fromLocation(AppRouteNames value) {
    return values.firstWhere((element) => element.route == value,
        orElse: () => XNavigationBarItems.home);
  }
}
