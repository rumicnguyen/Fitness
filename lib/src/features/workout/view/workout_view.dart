import 'package:fitness_app/src/themes/colors.dart';
import 'package:flutter/material.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Text('Workout screen'),
      ),
    );
  }
}
