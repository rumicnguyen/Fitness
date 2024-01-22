import 'package:fitness_app/src/themes/colors.dart';
import 'package:flutter/material.dart';

class ChallengeView extends StatelessWidget {
  const ChallengeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Text('Challenge screen'),
      ),
    );
  }
}