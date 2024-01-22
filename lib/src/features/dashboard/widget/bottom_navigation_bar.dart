import 'package:fitness_app/src/features/dashboard/logic/dasboard_state.dart';
import 'package:fitness_app/src/features/dashboard/logic/dashboard_bloc.dart';
import 'package:fitness_app/src/features/dashboard/logic/navigation_bar_item.dart';
import 'package:fitness_app/src/features/dashboard/widget/bottom_navbar_painter.dart';
import 'package:fitness_app/src/themes/colors.dart';
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
        return CustomPaint(
          painter: BottomNavBarPainter(),
          child: BottomNavigationBar(
            backgroundColor: AppColors.transparent,
            currentIndex: state.item.selectedIndex,
            onTap: context.read<DashboardBloc>().onDestinationSelected,
            items: _buildListItem(),
            unselectedItemColor: AppColors.slate_500,
            selectedItemColor: AppColors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            iconSize: 22,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _buildListItem() {
    return XNavigationBarItems.values
        .map(
          (e) => BottomNavigationBarItem(
            label: e.label,
            icon: Icon(e.icon),
            activeIcon: Icon(e.selectedIcon),
          ),
        )
        .toList();
  }
}
