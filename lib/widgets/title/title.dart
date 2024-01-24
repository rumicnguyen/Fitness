import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class XTitle extends StatelessWidget {
  const XTitle({
    super.key,
    required this.title,
    this.actions,
    this.height,
  });

  final String title;
  final Widget? actions;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 150,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppStyles.mainTitle,
            ),
            actions ?? Container(),
          ],
        ),
      ),
    );
  }
}
