import 'package:fitness_app/src/features/dashboard/logic/dasboard_state.dart';
import 'package:fitness_app/src/features/dashboard/logic/dashboard_bloc.dart';
import 'package:fitness_app/src/features/dashboard/logic/navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomNavigationBar extends StatelessWidget {
  const XBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) {
        return previous.item.selectedIndex != current.item.selectedIndex;
      },
      builder: (context, state) {
        return NavigationBar(
          selectedIndex: state.item.selectedIndex,
          onDestinationSelected:
              context.read<DashboardBloc>().onDestinationSelected,
          destinations: _buildListItem(),
        );
      },
    );
  }

  List<Widget> _buildListItem() {
    return XNavigationBarItems.values
        .map(
          (e) => NavigationDestination(
            label: e.label,
            icon: Icon(e.icon),
            selectedIcon: Icon(e.selectedIcon),
          ),
        )
        .toList();
  }
}
