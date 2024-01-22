import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class XHeading extends StatelessWidget {
  const XHeading({super.key, required this.header, required this.child});

  final String header;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              header,
              style: AppStyles.heading,
              textAlign: TextAlign.start,
            ),
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
