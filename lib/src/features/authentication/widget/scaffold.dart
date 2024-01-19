import 'package:fitness_app/src/themes/colors.dart';
import 'package:flutter/material.dart';

class XScaffold extends StatelessWidget {
  const XScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: child,
      ),
    );
  }
}
