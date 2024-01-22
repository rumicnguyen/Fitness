import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';

class XScaffold extends StatelessWidget {
  const XScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: XSection(
        right: 20,
        left: 20,
        bottom: 10,
        child: child,
      ),
    );
  }
}
