import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';

class XScaffold extends StatelessWidget {
  const XScaffold({
    super.key,
    required this.child,
    this.actions,
    this.enableAppbar = false,
    this.iconColor,
  });

  final Widget child;
  final List<Widget>? actions;
  final bool enableAppbar;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: enableAppbar
          ? AppBar(
              backgroundColor: AppColors.white,
              iconTheme: IconThemeData(
                color: iconColor ?? AppColors.white,
              ),
              actions: actions,
            )
          : null,
      body: XSection(
        right: 20,
        left: 20,
        bottom: 10,
        child: child,
      ),
    );
  }
}
