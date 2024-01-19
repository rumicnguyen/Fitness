import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class SignTitle extends StatelessWidget {
  const SignTitle({super.key, required this.title, required this.guide});
  final String title;
  final String guide;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
            textAlign: TextAlign.center,
            style: AppStyles.grayTextSmallThin,
          ),
        ],
      ),
    );
  }
}
