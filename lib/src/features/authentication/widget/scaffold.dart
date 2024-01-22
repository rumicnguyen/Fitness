import 'package:fitness_app/src/themes/colors.dart';
import 'package:flutter/material.dart';

class SignScaffold extends StatelessWidget {
  const SignScaffold({
    super.key,
    required this.child,
    this.actions,
  });

  final Widget child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.bgTop,
            AppColors.bgBottom,
          ],
          transform: GradientRotation(90),
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColors.white,
          ),
          actions: actions,
          backgroundColor: AppColors.transparent,
        ),
        body: child,
      ),
    );
  }
}
