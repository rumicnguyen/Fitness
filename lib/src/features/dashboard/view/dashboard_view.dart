import 'package:fitness_app/src/features/dashboard/logic/dasboard_state.dart';
import 'package:fitness_app/src/features/dashboard/logic/dashboard_bloc.dart';
import 'package:fitness_app/src/features/dashboard/widget/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          // ignore: deprecated_member_use
          return WillPopScope(
            onWillPop: () async {
              context.read<DashboardBloc>().goHome();
              return false;
            },
            child: Scaffold(
              body: body,
              bottomNavigationBar: const XBottomNavigationBar(),
            ),
          );
        },
      ),
    );
  }
}
