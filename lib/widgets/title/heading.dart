import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class XHeading extends StatelessWidget {
  const XHeading(
      {super.key, required this.header, required this.child, this.action});

  final String header;
  final Widget child;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              header,
              style: AppStyles.heading,
              textAlign: TextAlign.start,
            ),
            action ?? Container(),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        child
      ],
    );
  }
}
