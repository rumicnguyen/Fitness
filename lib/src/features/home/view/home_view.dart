import 'package:fitness_app/src/features/home/view/dashboard_view.dart';
import 'package:fitness_app/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const XScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DashboardView(),
          ],
        ),
      ),
    );
  }
}
