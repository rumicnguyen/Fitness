import 'package:fitness_app/src/features/dashboard/logic/dashboard_bloc.dart';
import 'package:fitness_app/src/features/dashboard/logic/navigation_bar_item.dart';
import 'package:fitness_app/src/features/dashboard/widget/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({
    super.key,
    required this.currentItem,
    required this.body,
  });

  final XNavigationBarItems currentItem;
  final Widget body;

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

/*
  /// Change to config router. It need to be corrected
class _DashBoardScreenState extends State<DashBoardScreen> with LifecycleMixin {
*/
class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(widget.currentItem),
      child: BlocBuilder<DashboardBloc, XNavigationBarItems>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              context.read<DashboardBloc>().goHome();
              return false;
            },
            child: Scaffold(
              body: widget.body,
              bottomNavigationBar: const XBottomNavigationBar(),
            ),
          );
        },
      ),
    );
  }

  @override
  void onPause() {}

  @override
  void onResume() {}
}
