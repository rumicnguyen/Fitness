import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class SignTitle extends StatelessWidget {
  const SignTitle({super.key, required this.title, required this.guide});
  final String title;
  final String guide;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 50, 32, 0),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.signTitle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            guide,
            style: AppStyles.grayTextSmallThin,
          ),
        ],
      ),
    );
  }
}
