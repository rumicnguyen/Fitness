import 'package:fitness_app/src/themes/colors.dart';
import 'package:flutter/material.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Text('Activity screen'),
      ),
    );
  }
}
