import 'package:fitness_app/src/network/model/challenge/challenge.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class ChallengeDetailHeader extends StatelessWidget {
  const ChallengeDetailHeader({
    super.key,
    required this.challenge,
  });

  final MChallenge challenge;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          challenge.name,
          style: AppStyles.heading,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: ImageWidget(
            image: challenge.thumbnail,
            borderRadius: 10,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(height: 1.5),
            children: [
              TextSpan(
                text: challenge.decription,
                style: AppStyles.grayTextMidium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
