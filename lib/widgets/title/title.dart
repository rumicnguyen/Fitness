import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class XTitle extends StatelessWidget {
  const XTitle({
    super.key,
    required this.title,
    this.actions,
  });

  final String title;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
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
